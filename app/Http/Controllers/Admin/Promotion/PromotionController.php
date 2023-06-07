<?php

namespace App\Http\Controllers\Admin\Promotion;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Promotion;
use Yajra\Datatables\Datatables;
use DB;

class PromotionController extends Controller
{
    public function Promotion()
    {
        $SubCategories = new SubCategory();
        $Categories = new Category();
        $Categories = Category::all();
        $SubCategories = SubCategory::all();
        return view('Admin.Promotion.Promotion',compact('Categories','SubCategories'));
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
            'category_id' => $req->input('promo_id') ? '' : 'required',
            'sub_cat_id' => $req->input('promo_id') ? '' : 'required',
            'image' => $req->input('promo_id') ? 'mimes:jpeg,jpg,png|max:2048' : 'required|image|mimes:jpeg,jpg,png|max:2048'
        ]);

        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        if($req->hasFile('image'))
        {

            $image_parts = explode(";base64,", $req->promotion_attachment);
            $imageName = uniqid() . '.'.explode("image/", $image_parts[0])[1];
            file_put_contents(public_path('Files/Promotion/') . "/". $imageName, base64_decode($image_parts[1]));
            if($req->input('promo_id'))
            {
                $findImage = Promotion::where('promotion_id',$req->input('promo_id'))->first();
                if(file_exists('public/Files/Promotion/'.$findImage->promotion_attachment) AND !empty($findImage->promotion_attachment))
                {
                    unlink('public/Files/Promotion/'.$findImage->promotion_attachment);
                }

            }
        }
        else{
            $data = Promotion::where('promotion_id',$req->input('promo_id'))->get();
            $imageName = $data[0]->promotion_attachment;
        }

        try {
            $Promotion = Promotion::updateOrCreate(

                ['promotion_id' => $req->input('promo_id')],
                [
                    'promotion_attachment' => $imageName,
                    'category_id' => $req->input('category_id'),
                    'sub_cat_id' => $req->input('sub_cat_id')
                ]
            );
            return response()->json(["success" => true, "message" => $Promotion->wasRecentlyCreated ? "Promotion Create Successfully" : "Promotion Updated Successfully"]);
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err"=>$th]);
        }
    }
    public function PromotionShow()
    {
        $Promotion = Promotion::with(['category','subcategory']);
        return Datatables::of($Promotion)
        ->addColumn('action', function ($Promotion) {
            return
            '<button class="btn btn-primary" onclick="PromotionEdit('.$Promotion->promotion_id.')">
            <i class="fa fa-edit"></i></button>
            <button class="btn btn-danger" onclick="PromotionRemove('.$Promotion->promotion_id.')"><i class="fa fa-trash"></i>
            </button>';
        })
        ->rawColumns(['action'])
        ->make(true);
    }
    public function PromotionEdit(Request $req)
    {
        $promo_id = $req->input('id');
        $Promotion = Promotion::where('promotion_id',$promo_id)->get();
        return response()->json(["data" => $Promotion]);
    }
    public function PromotionDestroy(Request $req)
    {
        $Promotion = Promotion::where('promotion_id',$req->input('id'))->first();

        if(file_exists('public/Files/Promotion/'.$Promotion->promotion_attachment))
        {
            unlink('public/Files/Promotion/'.$Promotion->promotion_attachment);
        }
        $data = Promotion::where('promotion_id',$req->input('id'))->delete();

        if($data)
        {
            return response()->json(['success' => true, 'message' => 'Promotion Deleted Successfully']);
        }
        else
        {
            return response()->json(['success' => false, 'message' => 'Deleted Failed..!']);
        }

    }
}
