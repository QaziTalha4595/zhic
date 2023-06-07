<?php

namespace App\Http\Controllers\Admin\Category;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\ThirdCategory;
use App\Models\Language;
use Yajra\Datatables\Datatables;
use Illuminate\Support\Carbon;
use DB;

// use Validator;

function FormatData($from_date,$to_date){
    $from = $from_date ?(new \DateTime($from_date))->format('Y-m-d'):"";
    $to = $to_date ? (new \DateTime($to_date))->format('Y-m-d'):"";
    return [$from,$to];
}

class CategoryController extends Controller
{
    //For Category
    public function Category(){
        return view('Admin.Category.Category');
    }
    public function CategoryShow(Request $req){
        if ($req->ajax()){
            extract($req->input());
            [$from, $to] = FormatData($from_date,$to_date);

            $query = Category::query();

            if ($from && $to){$query->whereBetween('created_at', [$from, $to]);}
            if ($from || $to){$query->whereDate('created_at', $from?: $to);}

            return Datatables::of($query->get())->editColumn('created_at', function ($data) {
                return Carbon::createFromFormat('Y-m-d H:i:s', $data->created_at)->format('d-m-Y');
            })->addColumn('action', function ($data) {
                return ('
                <button class="btn btn-primary mx-1" onclick="CategoryEdit('.$data->category_id.')" ><i class="fa fa-edit"></i></button>
                <button class="btn btn-danger mx-1" onclick="CategoryRemove('.$data->category_id.')"><i class="fa fa-trash"></i></button>
                ');
            })->rawColumns(['action'])->make(true);
        }
    }
    public function CategoryStore(Request $req){
        $data = $req->input();

        unset($data['_token']);
        $validator = Validator::make($req->all(), [
            'category_name' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'
        ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        $data['category_slug'] = strtolower(str_replace(" ","_",$data['category_name']));
        try {
            $category = Category::updateOrCreate(['category_id'=> $data['category_id']],$data);
            return response()->json(["success" => true, "message" => true ? "Category Detail Create Successfully" : "Category Detail Updated Successfully"]);
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }
    }
    public function CategoryEdit(Request $req){
        return response()->json(["data" => Category::where('category_id', $req->input('category_id'))->get()]);
    }
    public function CategoryDestroy(Request $req){
        if (Category::where('category_id', $req->input('category_id'))->delete()) {
            return response()->json(["success" => true, "message" => "Category Deleted Succesfully"]);
        } else {
            return response()->json(["success" => false, "message" => "Category Remove Failed...!"]);
        }
    }

    //For Sub Category
    public function SubCategory(){
        $Categories = Category::all();
        return view('Admin.Category.SubCategory', compact('Categories'));
    }
    public function SubCategoryShow(Request $req){
        if ($req->ajax()) {
            extract($data = $req->input());
            [$from, $to] = FormatData($from_date,$to_date);

            $query = SubCategory::join('category', 'category__sub.category_id', '=', 'category.category_id')->select('category__sub.*', 'category.category_name', 'category__sub.sub_cat_name');

            if ($from && $to){$query->whereBetween('category__sub.created_at', [$from, $to]);}
            elseif ($from || $to){$query->whereDate('category__sub.created_at', $from?: $to);}
            if ($category_id){$query->where('category.category_id', $category_id);}

            return Datatables::of($query->get())->editColumn('created_at', function ($data) {
                return Carbon::createFromFormat('Y-m-d H:i:s', $data->created_at)->format('d-m-Y');
            })
            ->addColumn('action', function ($data) {
                return('
                <button class="btn btn-primary" onclick="SubCategoryEdit('.$data->sub_cat_id.')"><i class="fa fa-edit" id="edit_btn"></i></button>
                <button class="btn btn-danger ml-2" onclick="SubCategoryRemove('.$data->sub_cat_id.')"><i class="fa fa-trash"></i></button>
                ');
            })
            ->rawColumns(['action'])->make(true);
        }
    }
    public function SubCategoryStore(Request $req){
        $data = $req->input();
        unset($data['_token']);
        $validator = Validator::make($req->all(), [
            'category_id' => 'required',
            'sub_cat_name' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'
        ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        $data['sub_cat_slug'] = strtolower(str_replace(" ","_",$req->input('sub_cat_name')));
        try {
            $SubCategory = SubCategory::updateOrCreate(['sub_cat_id'=> $data['sub_cat_id']],$data);
            return response()->json(["success" => true, "message" => $SubCategory->wasRecentlyCreated ? "Sub Category Create Successfully" : "Sub Category Updated Successfully"]);
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }
    }
    public function SubCategoryEdit(Request $req){
        return response()->json(["data" => SubCategory::where('sub_cat_id', $req->input('sub_cat_id'))->get()]);
    }
    public function SubCategoryDestroy(Request $req){
        if (SubCategory::where('sub_cat_id', $req->input('sub_cat_id'))->delete()) {
            return response()->json(['success' => true, 'message' => 'SubCategory Remove Successfully']);
        } else {
            return response()->json(['success' => false, 'message' => 'SubCategory Remove Failed..!']);
        }
    }

    //Third Category
    public function ThirdCategory(){
        $Category = Category::all();
        return view('Admin.Category.ThirdCategory', compact('Category'));
    }
    public function ThirdCategoryShow(Request $req){
        if ($req->ajax()) {
            extract($req->input());
            [$from, $to] = FormatData($from_date,$to_date);
            $query = ThirdCategory::join('category', 'category__third.category_id', '=', 'category.category_id')->join('category__sub', 'category__third.sub_cat_id', '=', 'category__sub.sub_cat_id')->select('category__third.*', 'category.category_name', 'category__sub.sub_cat_name');
            if ($from && $to){$query->whereBetween('category__third.created_at', [$from, $to]);}
            elseif ($from || $to){$query->whereDate('category__third.created_at', $from?: $to);}
            if ($category_id){$query->where('category__third.category_id', $category_id);}
            if ($sub_cat_id){$query->where('category__third.sub_cat_id', $sub_cat_id);}

        return Datatables::of($query->get())->editColumn('created_at', function ($ThirdCategories) {
            return Carbon::createFromFormat('Y-m-d H:i:s', $ThirdCategories->created_at)->format('Y-m-d');
        })
        ->addColumn('action', function ($ThirdCategories) {
                return '<button class="btn btn-primary" data-toggle="modal" data-target="#ThirdCategoryStoreModal" onclick="ThirdCategoryEdit('.$ThirdCategories->third_cat_id.')"><i class="fa fa-edit"></i></button><button class="btn btn-danger ml-2" onclick="ThirdCategoryRemove('.$ThirdCategories->third_cat_id.')"><i class="fa fa-trash"></i></button>';
            })->rawColumns(['action'])->make(true);

        }
    }
    public function ThirdCategoryStore(Request $req){
        $data = $req->input();
        unset($data['_token']);
        $validator = Validator::make($req->all(), [
            'category_id' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'sub_cat_id' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'third_cat_name' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'
        ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        $data['third_cat_slug'] = strtolower(str_replace(" ","_",$req->input('third_cat_name')));
        try {
            $ThirdCategory = ThirdCategory::updateOrCreate(['third_cat_id'=>$req->input('third_cat_id')],$data);
            return response()->json(["success" => true, "message" => $ThirdCategory->wasRecentlyCreated ? "Third Category Create Successfully" : "Third Category Updated Successfully"]);
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }
    }
    public function ThirdCategoryEdit(Request $req){
        return response()->json(["data" => ThirdCategory::where('third_cat_id', $req->input('third_cat_id'))->get()]);
    }
    public function ThirdCategoryDestroy(Request $req){
        $ThirdCategory = ThirdCategory::where('third_cat_id', $req->input('id'))->delete();

        if ($ThirdCategory) {
            return response()->json(['success' => true, 'message' => 'Third Category Deleted Successfully']);
        } else {
            return response()->json(['success' => false, 'message' => 'Delete Failed..!']);
        }
    }

    //Common
    public function FetchSubCategory(Request $req){


        $data = SubCategory::where('category_id', $req->input('category_id'))->get();

        return response()->json(["data" => $data]);
    }

    //Language
    public function Language(){
        return view('Admin.Category.Languages');
    }
    public function LanguageShow(Request $req){
        $query = Language::query();
        return Datatables::of($query->get())
            ->addColumn('action', function ($data) {
                return '
                <button class="btn btn-primary" data-toggle="modal" data-target="#LanguageStoreModal" onclick="LanguageEdit('.$data->language_id.')"><i class="fa fa-edit"></i></button>
                <button class="btn btn-danger ml-2" onclick="LanguageRemove('.$data->language_id.')"><i class="fa fa-trash"></i></button>
                ';
            })
            ->rawColumns(['action'])
            ->make(true);
    }
    public function LanguageStore(Request $req){
        $validator = Validator::make($req->all(), [
            'language' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'
        ]);
        extract($req->input());
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        try {
            $Language = Language::updateOrCreate(['language_id'   => $lang_id],['language' => $language]);
            return response()->json(["success" => true, "message" => $Language->wasRecentlyCreated ? "Language Created Successfully" : "Language Updated Successfully"]);
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }

    }
    public function LanguageEdit(Request $req){
        return response()->json(["data" => Language::where('language_id', $req->input('language_id'))->get()]);
    }
    public function LanguageDestroy(Request $req){
        if (Language::where('id', $req->input('id'))->delete()) {
            return response()->json(['success' => true, 'message' => 'Language Deleted Successfully']);
        } else {
            return response()->json(['success' => false, 'message' => 'Delete Failed..!']);
        }
    }
}
