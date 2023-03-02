<?php

namespace App\Http\Controllers\Admin\Promotion;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Promotion;
use Yajra\Datatables\Datatables;

class PromotionController extends Controller
{
    public function Promotion()
    {
        $Categories = new Category();
        $Categories = Category::all();
        return view('Admin.Promotion.Promotion',compact('Categories'));
    }
    public function FetchSubCategory(Request $req)
    {
        $SubCategories['sub_categories'] = SubCategory::where('category_id',$req->cat_id)->get();
        return response()->json(["data" => $SubCategories]);
    }
    public function PromotionStore(Request $req)
    {
        $Promotion = new Promotion();
        
            $validator = Validator::make($req->all(), [
                'slider_heading' => 'required',
                'slider_caption' => 'required',
                'slider_link' => 'required|regex:/^[a-z A-Z]+$/u',              
                'slider_bg_color' => 'required',
                'slider_image' => $req->input('slider_id') ? '' : 'required|image|mimes:jpeg,jpg,png|max:2048'
            ]);
            if ($validator->fails()) {
                return response()->json(["validate" => true, "message" => $validator->errors()->all()]);
            }
            $imageNameWithExt = $imageName = $extention = $imageNameToStore = $image = '';

            if($req->hasFile('slider_image'))
            {
                
                $imageNameWithExt = $req->file('slider_image')->getClientOriginalName();
                $imageName = pathinfo($imageNameWithExt, PATHINFO_FILENAME);
                $extention = $req->file('slider_image')->getClientOriginalExtension();
                $imageNameToStore = $imageName.'_'.time().'.'.$extention;
                        
                if($req->input('slider_id'))
                {
                    $image = $req->file('slider_image')->move(public_path('Slider'),$imageNameToStore);
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
}
