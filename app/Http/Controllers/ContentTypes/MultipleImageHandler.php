<?php

namespace App\Http\Controllers\ContentTypes;

use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\File;
use Intervention\Image\Constraint;
use Intervention\Image\Facades\Image as InterventionImage;
use TCG\Voyager\Http\Controllers\ContentTypes\BaseType;

class MultipleImageHandler extends BaseType
{
    /**
     * @return string
     */
    public function handle()
    {
        $filesPath = [];
        $files = Arr::wrap($this->request->file($this->row));
        // if (!$files) {
        //     return;
        // }

        foreach ($files as $file) {
            // if (!$file->isValid()) {
            //     continue;
            // }
            $ext = $file->getClientOriginalExtension();
            if($file->getClientMimeType() == 'image/heif' || $file->getClientMimeType() == 'image/heic' || $file->getClientMimeType() == 'application/octet-stream'){
                $ext = 'jpg';
            }
            
            $image = InterventionImage::make($file)->orientate();
            
            $resize_width = null;
            $resize_height = null;

            if (isset($this->options->resize) && (isset($this->options->resize->width) || isset($this->options->resize->height))) {
                if (isset($this->options->resize->width)) {
                    $resize_width = $this->options->resize->width;
                }
                if (isset($this->options->resize->height)) {
                    $resize_height = $this->options->resize->height;
                }
            } else {
                $resize_width = $image->width();
                $resize_height = $image->height();
            }

            $resize_quality = intval($this->options->quality ?? 75);

            $id = '';
            if ($this->request->id) {
                $id = $this->request->id . "/";
            }

            $filename = Str::random(20);
            $path = $this->slug . "/" . $id . date('Y') . "/" . date('m') . "/";
            $dir = $path . Carbon::now()->timestamp . '_' . uniqid() . '_' . $filename . '.' . $ext;
            array_push($filesPath, $dir);

            $image = $image->resize(
                $resize_width,
                $resize_height,
                function (Constraint $constraint) {
                    $constraint->aspectRatio();
                    if (isset($this->options->upsize) && !$this->options->upsize) {
                        $constraint->upsize();
                    }
                }
            )->encode($ext, $resize_quality);

            Storage::disk(config('voyager.storage.disk'))->put($dir, (string) $image, 'public');

            if (isset($this->options->thumbnails)) {
                foreach ($this->options->thumbnails as $thumbnails) {
                    if (isset($thumbnails->name) && isset($thumbnails->scale)) {
                        $scale = intval($thumbnails->scale) / 100;
                        $thumb_resize_width = $resize_width;
                        $thumb_resize_height = $resize_height;

                        if ($thumb_resize_width != null && $thumb_resize_width != 'null') {
                            $thumb_resize_width = $thumb_resize_width * $scale;
                        }

                        if ($thumb_resize_height != null && $thumb_resize_height != 'null') {
                            $thumb_resize_height = $thumb_resize_height * $scale;
                        }

                        $image = InterventionImage::make($file)
                            ->orientate()
                            ->resize(
                                $thumb_resize_width,
                                $thumb_resize_height,
                                function (Constraint $constraint) {
                                    $constraint->aspectRatio();
                                    if (isset($this->options->upsize) && !$this->options->upsize) {
                                        $constraint->upsize();
                                    }
                                }
                            )->encode($ext, $resize_quality);
                    } elseif (isset($this->options->thumbnails) && isset($thumbnails->crop->width) && isset($thumbnails->crop->height)) {
                        $crop_width = $thumbnails->crop->width;
                        $crop_height = $thumbnails->crop->height;
                        $image = InterventionImage::make($file)
                            ->orientate()
                            ->fit($crop_width, $crop_height)
                            ->encode($ext, $resize_quality);
                    }

                    Storage::disk(config('voyager.storage.disk'))->put(
                        $path . $filename . '-' . $thumbnails->name . '.' . $ext,
                        (string) $image,
                        'public'
                    );
                }
            }
        }

        return json_encode($filesPath);
    }
}
