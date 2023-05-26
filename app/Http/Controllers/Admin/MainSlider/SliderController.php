<?php

namespace App\Http\Controllers\Admin\MainSlider;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\Slider;
use Yajra\Datatables\Datatables;

class SliderController extends Controller
{
    public function Slider()
    {
        return view('Admin.MainSlider.Slider');
    }
    public function SliderStore(Request $req)
    {
        $Slider = new Slider();

            $validator = Validator::make($req->all(), [
                'slider_heading' => 'required',
                'slider_caption' => 'required',
                'slider_bg_color' => 'required'
                // 'slider_image' => $req->input('slider_id') ? 'mimes:jpeg,jpg,png|max:2048' : 'required|image|mimes:jpeg,jpg,png|max:2048'
            ]);

            if ($validator->fails()) {
                return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
            }

            if($req->hasFile('image'))
            {

                $image_parts = explode(";base64,", $req->promotion_attachment);
                $imageName = uniqid() . '.'.explode("image/", $image_parts[0])[1];
                $path = public_path('Slider/') . "/". $imageName;

                file_put_contents(public_path('Slider/') . "/". $imageName, base64_decode($image_parts[1]));

                if($req->input('slider_id'))
                {
                    $findImage = Slider::where('id',$req->input('slider_id'))->first();
                    if(file_exists('public/Slider/'.$findImage->slider_image) AND !empty($findImage->slider_image))
                    {
                        unlink('public/Slider/'.$findImage->slider_image);
                    }

                }
            }
            else
            {
                $data = Slider::where('id',$req->input('slider_id'))->get();
                $imageName = $data[0]->slider_image;
                $path = $data[0]->slider_link;
            }

            try {
                $Slider = Slider::updateOrCreate(

                    ['id' => $req->input('slider_id')],
                    [
                        'slider_heading' => $req->input('slider_heading'),
                        'slider_caption' => $req->input('slider_caption'),
                        'slider_bg_color' => $req->input('slider_bg_color'),
                        'slider_position' => $req->input('slider_position'),
                        'slider_link' => $path,
                        'slider_image' => $imageName
                    ]
                );
                return response()->json(["success" => true, "message" => $Slider->wasRecentlyCreated ? "Slider Create Successfully" : "Slider Updated Successfully"]);
            } catch (\Throwable $th) {
                return $th;
                return response()->json(["success" => false, "message" => "Opps an Error Occured", "err"=>$th]);
            }
    }
    public function SliderShow()
    {
        $Slider = Slider::OrderBy('id','DESC');
        return Datatables::of($Slider)
        ->addColumn('Action', function ($Slider) {
            return
            '<button class="btn btn-primary" data-toggle="modal" data-target="#SliderStoreModal" onclick="SliderEdit('.$Slider->id.')">
            <i class="fa fa-edit"></i></button>
            <button class="btn btn-danger" onclick="SliderRemove('.$Slider->id.')"><i class="fa fa-trash"></i>
            </button>';
        })
        ->rawColumns(['Action'])
        ->make(true);
    }
    public function SliderEdit(Request $req)
    {
        $slider_id = $req->input('id');
        $Slider = Slider::where('id',$slider_id)->get();
        return response()->json(["data" => $Slider]);
    }
    public function SliderDestroy(Request $req)
    {
        $Slider = Slider::where('id',$req->input('id'))->first();
        if(file_exists('public/Slider/'.$Slider->slider_image) AND !empty($Slider->slider_image))
        {
            unlink('public/Slider/'.$Slider->slider_image);
        }
        $data = Slider::where('id',$req->input('id'))->delete();
        if($data)
        {
            return response()->json(['success' => true, 'message' => 'Slider Detail Remove Successfully']);
        }
        else
        {
            return response()->json(['success' => false, 'message' => 'Remove Failed..!']);
        }
        return false;
    }
}
