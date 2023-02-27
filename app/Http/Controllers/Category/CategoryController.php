<?php

namespace App\Http\Controllers\Category;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Category;
use Yajra\Datatables\Datatables;

class CategoryController extends Controller
{
    //For Category
    public function Category(Request $request)
    {
        return view('Admin.Category.Category');
    }
    public function CategoryShow()
    {
        $Category = Category::OrderBy('id','DESC');
        return Datatables::of($Category)
        ->addColumn('action', function ($Category) {
            return
            '<button class="btn btn-primary" data-toggle="modal" data-target="#CategoryStoreModal"
            onclick="CategoryEdit('.$Category->id.')">
            <i class="fa fa-edit"></i></button>
            <button class="btn btn-danger" onclick="CategoryRemove('.$Category->id.')"><i class="fa fa-trash"></i>
            </button>';
        })
        ->rawColumns(['action'])
        ->make(true);
    } 
    public function CategoryEdit(Request $request)
    {
        $cat_id = $request->input('id');
        $category = Category::where('id',$cat_id)->get();
        return response()->json(["data" => $category]);
    }
    public function CategoryStore(Request $req)                         
    {
        $category = new Category();
        if($req->input('cat_id'))
        {
            $category = Category::find($req->input('cat_id'));

            $validator = Validator::make($req->all(), [
                'category_name' => 'required'
            ]);
    
            if($validator->fails()) {
                return response()->json(["validate" => true, "message" =>$validator->errors()->all()[0]]);
            }
    
            $category->category_name = $req->input('category_name');
            // $customer->cus_name = $request->input('cus_name_edit');
            if($category->save())
            {
                return response()->json(["success" => true, "message" => "Category Detail Updated Successfully"]);
            }
            else
            {
                return response()->json(["success" => false, "message" => "Category Updated failed..!"]);
            }
            return false;
        }
        else
        {

        $validator = Validator::make($req->all(), [
            'category_name' => 'required'
        ]);

        if($validator->fails()) {
            return response()->json(["validate" => true, "message" =>$validator->errors()->all()[0]]);
        }

        $category->category_name = $req->input('category_name');
       
        if($category->save())
        {
            return response()->json(["success" => true, "message" => "Category Detail Stored Successfully"]);
        }
        else
        {
            return response()->json(["success" => false, "message" => "Category Store failed..!"]);
        }
    }

    }
    public function CategoryDestroy(Request $req)
    {
        $category = Category::where('id',$req->input('id'))->delete();

        if($category)
        {
            return response()->json(["success" => true, "message" => "Category Deleted Succesfully"]);
        }
        else
        {
            return response()->json(["success" => false, "message" => "Category Remove Failed...!" ]);
        }
    }
    //For Sub Category
    public function SubCategory()
    {
        return view('Admin.Category.SubCategory');
    }
}
