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
                'slider_link' => 'required|regex:/^[a-z A-Z]+$/u',              
                'slider_bg_color' => 'required',
                'slider_image' => $req->input('slider_id') ? '' : 'required|image|mimes:jpeg,jpg,png|max:2048'
            ]);

            if ($validator->fails()) {
                return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
            }
            $imageNameWithExt = $imageName = $extention = $imageNameToStore = $image = '';

            if($req->hasFile('slider_image'))
            {
                $imageNameWithExt = $req->file('slider_image')->getClientOriginalName();
                $imageName = pathinfo($imageNameWithExt, PATHINFO_FILENAME);
                $extention = $req->file('slider_image')->getClientOriginalExtension();
                $imageNameToStore = $imageName.'_'.time().'.'.$extention;
                $image = $req->file('slider_image')->move(public_path('Slider'),$imageNameToStore);
                                        
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
                $imageNameToStore = $data[0]->slider_image;
            }
    
            try {
                $Slider = Slider::updateOrCreate(

                    ['id' => $req->input('slider_id')],
                    [
                        'slider_heading' => $req->input('slider_heading'),
                        'slider_caption' => $req->input('slider_caption'),
                        'slider_link' => $req->input('slider_link'),
                        'slider_bg_color' => $req->input('slider_bg_color'),
                        'slider_position' => $req->input('slider_link'),
                        'slider_image' => $imageNameToStore
                    ]
                );
                return response()->json(["success" => true, "message" => $Slider->wasRecentlyCreated ? "Slider Create Successfully" : "Slider Updated Successfully"]);
            } catch (\Throwable $th) {
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
            return response()->json(['success' => true, 'message' => 'SLide Remove Successfully']);
        }
        else
        {
            return response()->json(['success' => false, 'message' => 'Remove Failed..!']);
        }
        return false;
    }
}
