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
                $path = $imageName;
                file_put_contents(public_path('Files/Main-Slider/')."/".$imageName, base64_decode($image_parts[1]));


                if($req->input('slider_id'))
                {
                    $findImage = Slider::where('slider_id',$req->input('slider_id'))->first();
                    if(file_exists('public/Files/Main-Slider/'.$findImage->slider_img) AND !empty($findImage->slider_img))
                    {
                        unlink('public/Files/Main-Slider/'.$findImage->slider_img);
                    }

                }
            }
            else
            {
                $data = Slider::where('slider_id',$req->input('slider_id'))->get();
                $imageName = $data[0]->slider_img;
                $path = $data[0]->slider_link;
            }

            try {
                $Slider = Slider::updateOrCreate(

                    ['slider_id' => $req->input('slider_id')],
                    [
                        'slider_heading' => $req->input('slider_heading'),
                        'slider_caption' => $req->input('slider_caption'),
                        'slider_bg' => $req->input('slider_bg_color'),
                        'slider_position' => $req->input('slider_position'),
                        'link' => $path,
                        'slider_img' => $imageName
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
        $Slider = Slider::OrderBy('slider_id','DESC');
        return Datatables::of($Slider)
        ->addColumn('Action', function ($Slider) {
            return
            '<button class="btn btn-primary" onclick="SliderEdit('.$Slider->slider_id.')">
            <i class="fa fa-edit"></i></button>
            <button class="btn btn-danger" onclick="SliderRemove('.$Slider->slider_id.')"><i class="fa fa-trash"></i>
            </button>';
        })
        ->rawColumns(['Action'])
        ->make(true);
    }
    public function SliderEdit(Request $req)
    {
        $slider_id = $req->input('id');

        $Slider = Slider::where('slider_id',$slider_id)->get();
        return response()->json(["data" => $Slider]);
    }
    public function SliderDestroy(Request $req)
    {
        $Slider_id = $req->input('id');

        $Slider = Slider::where('slider_id',$Slider_id)->first();

        if(file_exists('public/Files/Main-Slider/'.$Slider->slider_img) AND !empty($Slider->slider_img))
        {
            unlink('public/Files/Main-Slider/'.$Slider->slider_img);
        }
        $data = Slider::where('slider_id',$Slider_id)->delete();

        if($data)
        {
            return response()->json(['success' => true, 'message' => 'Slider Image Remove Successfully']);
        }
        else
        {
            return response()->json(['success' => false, 'message' => 'Remove Failed..!']);
        }
        return false;
    }
}
