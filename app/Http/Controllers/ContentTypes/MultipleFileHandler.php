<?php

namespace App\Http\Controllers\ContentTypes;

use Carbon\Carbon;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use TCG\Voyager\Http\Controllers\ContentTypes\BaseType;

class MultipleFileHandler extends BaseType
{
    /**
     * @return string
     */
    public function handle()
    {
        if (!$this->request->hasFile($this->row)) {
            return;
        }

        $files = Arr::wrap($this->request->file($this->row));

        $filesPath = [];
        $path = $this->generatePath();

        foreach ($files as $file) {
            $filename = $this->generateFileName($file, $path);
            // $filePath = $path . Carbon::now()->timestamp . '_' . uniqid() . '_' . $filename . '.' . $file->getClientOriginalExtension();
            $file->storeAs(
                $path,
                $filename,
                config('voyager.storage.disk', 'public')
            );

            array_push($filesPath, [
                'download_link' => $path . $filename,
                'original_name' => $file->getClientOriginalName(),
            ]);
        }

        return json_encode($filesPath);
    }

    /**
     * @return string
     */
    protected function generatePath()
    {
        $id = '';
        if ($this->request->id) {
            $id = $this->request->id . "/";
        }

        return $this->slug . "/" . $id . date('Y') . "/" . date('m') . "/";
    }

    /**
     * @return string
     */
    protected function generateFileName($file, $path)
    {
        if (isset($this->options->preserveFileUploadName) && $this->options->preserveFileUploadName) {
            $filename = Carbon::now()->timestamp . '_' . uniqid() . '_' . $file->getClientOriginalName() . '.' . $file->getClientOriginalExtension();
            $filename_counter = 1;

            // Make sure the filename does not exist, if it does make sure to add a number to the end 1, 2, 3, etc...
            while (Storage::disk(config('voyager.storage.disk'))->exists($path . $filename)) {
                $filename = basename($file->getClientOriginalName(), '.' . $file->getClientOriginalExtension()) . (string) ($filename_counter++);
            }
        } else {
            $filename = Carbon::now()->timestamp . '_' . uniqid() . '_' . Str::random(20) . '.' . $file->getClientOriginalExtension();

            // Make sure the filename does not exist, if it does, just regenerate
            while (Storage::disk(config('voyager.storage.disk'))->exists($path . $filename)) {
                $filename = Carbon::now()->timestamp . '_' . uniqid() . '_' . Str::random(20) . '.' . $file->getClientOriginalExtension();
            }
        }

        return $filename;
    }
}
