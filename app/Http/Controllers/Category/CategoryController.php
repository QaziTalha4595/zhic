<?php

namespace App\Http\Controllers\Category;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\ThirdCategory;
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
        // $SubCategory = new SubCategory();
        // $SubCategory = SubCategory::with(['Category']);
        // return view('Admin.Category.SubCategory',compact('SubCategory'));

        $categories = Category::all();
        return view('Admin.Category.SubCategory',compact('categories'));
    }
    public function SubCategoryShow()
    {
        $SubCategories = SubCategory::with(['Category'])->OrderBy('id','DESC');
        return Datatables::of($SubCategories)
        ->addColumn('Category', function ($SubCategories) {
            return $SubCategories->Category->category_name;
        })
        ->addColumn('action', function ($SubCategories) {
            return
            '<button class="btn btn-primary" data-toggle="modal" data-target="#SubCategoryStoreModal"
            onclick="SubCategoryEdit('.$SubCategories->id.')">
            <i class="fa fa-edit"></i></button>
            <button class="btn btn-danger" onclick="SubCategoryRemove('.$SubCategories->id.')"><i class="fa fa-trash"></i>
            </button>';
        })
        ->rawColumns(['action'])
        ->make(true);
    } 
    public function SubCategoryEdit(Request $request)
    {

        $sub_cat_id = $request->input('id');
        $SubCategories = SubCategory::where('id',$sub_cat_id)->get();
        return response()->json(["data" => $SubCategories]);
        
    }
    public function SubCategoryStore(Request $req)
    {
        $SubCategory = new SubCategory();
        if($req->input('sub_cat_id'))
        {
            $SubCategory = SubCategory::find($req->input('sub_cat_id'));

            $validator = Validator::make($req->all(), [
                'category_id' => 'required',
                'sub_category_name' => 'required'
            ]);
    
            if($validator->fails()) {
                return response()->json(["validate" => true, "message" =>$validator->errors()->all()[0]]);
            }
    
            $SubCategory->sub_category_name = $req->input('sub_category_name');
            $SubCategory->category_id = $req->input('category_id');
            if($SubCategory->save())
            {
                return response()->json(["success" => true, "message" => "Sub Category Updated Successfully"]);
            }
            else
            {
                return response()->json(["success" => false, "message" => "Sub Category Updated failed..!"]);
            }
            return false;
        }
        else
        {

        $validator = Validator::make($req->all(), [
            'category_id' => 'required',
            'sub_category_name' => 'required'
        ]);

        if($validator->fails()) {
            return response()->json(["validate" => true, "message" =>$validator->errors()->all()[0]]);
        }

        $SubCategory->sub_category_name = $req->input('sub_category_name');
        $SubCategory->category_id = $req->input('category_id');
        
        if($SubCategory->save())
        {
            return response()->json(["success" => true, "message" => "Sub Category Detail Stored Successfully"]);
        }
        else
        {
            return response()->json(["success" => false, "message" => "Sub Category Store failed..!"]);
        }
    }
    }
    public function SubCategoryDestroy(Request $req)
    {
        $SubCategory = SubCategory::where('id',$req->input('id'))->delete();

        if($SubCategory)
        {
            return response()->json(['success' => true, 'message' => 'SubCategory Remove Successfully']);
        }
        else
        {
            return response()->json(['success' => false, 'message' => 'SubCategory Remove Failed..!']);
        }


    }
    //Third Category
    public function ThirdCategory()
    {
        $ThirdCategory = new ThirdCategory();
        // $ThirdCategory = ThirdCategory::with(['category','subcategory'])->get();
        $Category = Category::all();
        $SubCategory = SubCategory::all();
        return view('Admin.Category.ThirdCategory',compact('Category','SubCategory'));
    }
    public function ThirdCategoryStore(Request $req)
    {
        $ThirdCategory = new ThirdCategory();
        if($req->input('third_cat_id'))
        {
            $ThirdCategory = ThirdCategory::find($req->input('third_cat_id'));

            $validator = Validator::make($req->all(), [
                'category_id' => 'required',
                'sub_category_id' => 'required',
                'third_category_name' => 'required',              
                'slug' => 'required'
            ]);
    
            if($validator->fails()) {
                return response()->json(["validate" => true, "message" =>$validator->errors()->all()[0]]);
            }
            
            $ThirdCategory->category_id = $req->input('category_id');
            $ThirdCategory->sub_category_id = $req->input('sub_category_id');
            $ThirdCategory->third_category_name = $req->input('third_category_name');
            $ThirdCategory->slug = $req->input('slug');
            if($ThirdCategory->save())
            {
                return response()->json(["success" => true, "message" => "Sub Category Updated Successfully"]);
            }
            else
            {
                return response()->json(["success" => false, "message" => "Sub Category Updated failed..!"]);
            }
            return false;
        }
        else
        {

        $validator = Validator::make($req->all(), [
            'category_id' => 'required',
            'sub_category_id' => 'required',
            'third_category_name' => 'required',              
            'slug' => 'required'
        ]);

        if($validator->fails()) {
            return response()->json(["validate" => true, "message" =>$validator->errors()->all()[0]]);
        }

        $ThirdCategory->category_id = $req->input('category_id');
        $ThirdCategory->sub_category_id = $req->input('sub_category_id');
        $ThirdCategory->third_category_name = $req->input('third_category_name');
        $ThirdCategory->slug = $req->input('slug');
        
        if($ThirdCategory->save())
        {
            return response()->json(["success" => true, "message" => "Third Category Stored Successfully"]);
        }
        else
        {
            return response()->json(["success" => false, "message" => "Third Category Store failed..!"]);
        }
    }
    }
    public function ThirdCategoryShow()
    {
        $ThirdCategory = ThirdCategory::with(['category'],['subcategory'])->OrderBy('id','DESC');
        return Datatables::of($ThirdCategory)
        ->addColumn('Category', function ($ThirdCategory) {
            return $ThirdCategory->category->category_name;
        })
        ->addColumn('Sub Category', function($ThirdCategory){
            return $ThirdCategory->subcategory->sub_category_name;
        })
        ->addColumn('action', function ($ThirdCategory) {
            return
            '<button class="btn btn-primary" data-toggle="modal" data-target="#ThirdCategoryStoreModal"
            onclick="ThirdCategoryEdit('.$ThirdCategory->id.')">
            <i class="fa fa-edit"></i></button>
            <button class="btn btn-danger" onclick="ThirdCategoryRemove('.$ThirdCategory->id.')"><i class="fa fa-trash"></i>
            </button>';
        })
        ->rawColumns(['action'])
        ->make(true);
    } 
    public function ThirdCategoryEdit(Request $request)
    {
        $third_cat_id = $request->input('id');
        $ThirdCategories = ThirdCategory::where('id',$third_cat_id)->get();
        return response()->json(["data" => $ThirdCategories]);
        
    }
}
