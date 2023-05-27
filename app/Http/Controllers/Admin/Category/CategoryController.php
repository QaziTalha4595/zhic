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

class CategoryController extends Controller
{
    //For Category
    public function Category(Request $request)
    {
        $Categories = Category::all();
        return view('Admin.Category.Category', compact('Categories'));
    }

    public function CategoryShow(Request $req)
    {
        if ($req->ajax()){
            if ($req->input('from_date') || $req->input('to_date')){
                $to = $req->input('to_date') ?: (new \DateTime($req->input('from_date')))->modify('+1 day')->format('Y-m-d');
                $from = $req->input('from_date') ?: (new \DateTime($req->input('to_date')))->modify('-1 day')->format('Y-m-d');
                $Category = Category::whereBetween('created_at', [$from, $to])->get();
            }else{
                $Category = Category::OrderBy('category_id', 'DESC');
            }
        }

        return Datatables::of($Category)
            ->editColumn('created_at', function ($Category) {
                $formatedDate = Carbon::createFromFormat('Y-m-d H:i:s', $Category->created_at)->format('d-m-Y');
                return $formatedDate;
            })->addColumn('action', function ($Category) {
                return '<button class="btn btn-primary" data-toggle="modal" data-target="#CategoryStoreModal" onclick="CategoryEdit(' . $Category->category_id . ')"><i class="fa fa-edit"></i></button><button class="btn btn-danger" onclick="CategoryRemove('.$Category->category_id.')"><i class="fa fa-trash"></i></button>';
            })->rawColumns(['action'])->make(true);
    }

    public function CategoryEdit(Request $request)
    {
        $category_id = $request->input('category_id');
        $category = Category::where('category_id', $category_id)->get();
        return response()->json(["data" => $category]);
    }

    public function CategoryStore(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'category_name' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'
        ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        $category_slug = strtolower(str_replace(" ","_",$req->input('category_name')));

        try {
            $category = Category::updateOrCreate(
                ['category_id'   => $req->input('category_id')],
                ['category_name' => $req->input('category_name'), 'category_slug' => $category_slug]
            );
            return response()->json(["success" => true, "message" => $category->wasRecentlyCreated ? "Category Detail Create Successfully" : "Category Detail Updated Successfully"]);
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }
    }


    public function CategoryDestroy(Request $req)
    {
        if (Category::where('category_id', $req->input('category_id'))->delete()) {
            return response()->json(["success" => true, "message" => "Category Deleted Succesfully"]);
        } else {
            return response()->json(["success" => false, "message" => "Category Remove Failed...!"]);
        }
    }

    //For Sub Category
    public function SubCategory()
    {
        $SubCategories = SubCategory::all();
        $categories = Category::all();
        return view('Admin.Category.SubCategory', compact('categories','SubCategories'));
    }

    public function SubCategoryShow(Request $req)
    {
        if ($req->ajax()) {
            $query = SubCategory::join('category', 'category__sub.category_id', '=', 'category.category_id');

            if ($req->input('from_date') || $req->input('to_date')) {
                $to = $req->input('to_date') ?: (new \DateTime($req->input('from_date')))->modify('+1 day')->format('Y-m-d');
                $from = $req->input('from_date') ?: (new \DateTime($req->input('to_date')))->modify('-1 day')->format('Y-m-d');
                $query->whereBetween('category__sub.created_at', [$from, $to]);
            }
            if ($req->input('category_id')) {
                $query->where('category.category_id', $req->input('category_id'));
            }

            $SubCategories = $query->get();
        }

        return Datatables::of($SubCategories)
            ->editColumn('created_at', function ($SubCategories) {
                $formatedDate = Carbon::createFromFormat('Y-m-d H:i:s', $SubCategories->created_at)->format('d-m-Y');
                return $formatedDate;
            })
            ->addColumn('action', function ($SubCategories) {
                return
                    '<button class="btn btn-primary" data-toggle="modal" data-target="#SubCategoryStoreModal"
            onclick="SubCategoryEdit(' . $SubCategories->id . ')">
            <i class="fa fa-edit" id="edit_btn"></i></button>
            <button class="btn btn-danger" onclick="SubCategoryRemove(' . $SubCategories->id . ')"><i class="fa fa-trash"></i>
            </button>';
            })
            ->rawColumns(['action'])
            ->make(true);
    }
    public function SubCategoryEdit(Request $request)
    {

        $sub_category_id = $request->input('id');
        $SubCategories = SubCategory::where('id', $sub_category_id)->get();
        return response()->json(["data" => $SubCategories]);
    }
    public function SubCategoryStore(Request $req)
    {
        $validator = Validator::make($req->all(), [
            'category_id' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'sub_category_name' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'
        ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        $sub_cat_slug = strtolower(str_replace(" ","_",$req->input('sub_category_name')));
        try {
            $SubCategory = SubCategory::updateOrCreate(
                ['id'   => $req->input('sub_category_id')],
                [
                    'category_id' => $req->input('category_id'),
                    'sub_category_name' => $req->input('sub_category_name'),
                    'sub_category_slug' => $sub_cat_slug
                ]
            );
            return response()->json(["success" => true, "message" => $SubCategory->wasRecentlyCreated ? "Sub Category Create Successfully" : "Sub Category Updated Successfully"]);
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }
    }
    public function SubCategoryDestroy(Request $req)
    {
        $SubCategory = SubCategory::where('id', $req->input('id'))->delete();

        if ($SubCategory) {
            return response()->json(['success' => true, 'message' => 'SubCategory Remove Successfully']);
        } else {
            return response()->json(['success' => false, 'message' => 'SubCategory Remove Failed..!']);
        }
    }
    //Third Category
    public function FetchSubCategory(Request $req)
    {
        $SubCategories['sub_categories'] = SubCategory::where('category_id', $req->category_id)->get();
        return response()->json(["data" => $SubCategories]);
    }
    public function ThirdCategory()
    {
        $ThirdCategory = new ThirdCategory();
        // $ThirdCategory = ThirdCategory::with(['category','subcategory'])->get();
        $Category = Category::all();
        $SubCategory = SubCategory::all();
        return view('Admin.Category.ThirdCategory', compact('Category', 'SubCategory'));
    }
    public function ThirdCategoryStore(Request $req)
    {
        $ThirdCategory = new ThirdCategory();

        $validator = Validator::make($req->all(), [
            'category_id' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'sub_category_id' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'third_category_name' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'
        ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        $third_cat_slug = strtolower(str_replace(" ","_",$req->input('third_category_name')));
        try {
            $ThirdCategory = ThirdCategory::updateOrCreate(
                ['third_cat_id'   => $req->input('third_cat_id')],
                [
                    'category_id' => $req->input('category_id'),
                    'sub_category_id' => $req->input('sub_category_id'),
                    'third_category_name' => $req->input('third_category_name'),
                    'third_category_slug' => $third_cat_slug

                ]
            );
            return response()->json(["success" => true, "message" => $ThirdCategory->wasRecentlyCreated ? "Third Category Create Successfully" : "Third Category Updated Successfully"]);
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }
    }
    public function ThirdCategoryShow(Request $req)
    {
        if ($req->ajax()) {
            if ($req->input('from_date') && $req->input('to_date')) {
                $ThirdCategory = ThirdCategory::
                                whereBetween('created_at', [$req->input('from_date'), $req->input('to_date')])
                                ->with(['category','subcategory'])
                                ->get();
            }
            else if($req->input('category_name') && $req->input('sub_category_name'))
            {
                $ThirdCategory = ThirdCategory::where('category_id',$req->input('category_name'))
                                                ->where('sub_category_id',$req->input('sub_category_name'))
                                                ->with(['category','subcategory'])
                                                ->get();
            }
            else if ($req->input('category_name') || $req->input('sub_category_name')) {
                $ThirdCategory = ThirdCategory::where('category_id',$req->input('category_name'))
                                                ->orwhere('sub_category_id',$req->input('sub_category_name'))
                                                ->with(['category','subcategory'])
                                                ->get();
            }
            else if ($req->input('from_date') || $req->input('to_date'))
            {
                $ThirdCategory = ThirdCategory::whereDate('created_at', [$req->input('from_date')])
                ->orwhereDate('created_at', [$req->input('to_date')])
                ->with(['category','subcategory'])
                ->get();
            }
            else {
                $ThirdCategory = ThirdCategory::with(['category','subcategory'])->get();            }
        }
        return Datatables::of($ThirdCategory)
        ->editColumn('created_at', function ($ThirdCategory) {
            $formatedDate = Carbon::createFromFormat('Y-m-d H:i:s', $ThirdCategory->created_at)->format('d-m-Y');
            return $formatedDate;
        })
        ->addColumn('action', function ($ThirdCategory) {
                return
                    '<button class="btn btn-primary" data-toggle="modal" data-target="#ThirdCategoryStoreModal"
            onclick="ThirdCategoryEdit(' . $ThirdCategory->third_cat_id . ')">
            <i class="fa fa-edit"></i></button>
            <button class="btn btn-danger" onclick="ThirdCategoryRemove(' . $ThirdCategory->third_cat_id . ')"><i class="fa fa-trash"></i>
            </button>';
            })
            ->rawColumns(['action'])
            ->make(true);
    }
    public function ThirdCategoryEdit(Request $request)
    {
        $third_category_id = $request->input('third_cat_id');
        $ThirdCategories = ThirdCategory::where('third_cat_id', $third_category_id)->get();
        return response()->json(["data" => $ThirdCategories]);
    }
    public function ThirdCategoryDestroy(Request $req)
    {
        $ThirdCategory = ThirdCategory::where('third_cat_id', $req->input('id'))->delete();

        if ($ThirdCategory) {
            return response()->json(['success' => true, 'message' => 'Third Category Deleted Successfully']);
        } else {
            return response()->json(['success' => false, 'message' => 'Delete Failed..!']);
        }
    }
    //Language Section
    public function Language()
    {
        return view('Admin.Category.Languages');
    }
    public function LanguageStore(Request $req)
    {
        $Language = new Language();

        // $Language = Language::find($req->input('lang_id'));

        $validator = Validator::make($req->all(), [

            'language' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'

        ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }



        try {
            $Language = Language::updateOrCreate(
                ['id'   => $req->input('lang_id')],
                ['language' => $req->input('language')]

            );

            return response()->json(["success" => true, "message" => $Language->wasRecentlyCreated ? "Language Created Successfully" : "Language Updated Successfully"]);
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }

    }
    // public function LanguageStore(Request $req)
    // {
    //     $Language = new Language();
    //     if ($req->input('lang_id')) {
    //         $Language = Language::find($req->input('lang_id'));

    //         $validator = Validator::make($req->all(), [

    //             'language' => 'required|regex:/^[a-zA-Z]+$/u'

    //         ]);

    //         if ($validator->fails()) {
    //             return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
    //         }

    //         $Language->language = $req->input('language');

    //         if ($Language->save()) {
    //             return response()->json(["success" => true, "message" => "Language Updated Successfully"]);
    //         } else {
    //             return response()->json(["success" => false, "message" => "Language Updated failed..!"]);
    //         }
    //         return false;
    //     } else {

    //         $validator = Validator::make($req->all(), [

    //             'language' => 'required|regex:/^[a-zA-Z]+$/u'

    //         ]);

    //         if ($validator->fails()) {
    //             return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
    //         }

    //         $Language->language = $req->input('language');

    //         if ($Language->save()) {
    //             return response()->json(["success" => true, "message" => "Language Stored Successfully"]);
    //         } else {
    //             return response()->json(["success" => false, "message" => "Language Store failed..!"]);
    //         }
    //     }
    // }
    public function LanguageShow()
    {
        $Language = Language::OrderBy('id', 'DESC');
        return Datatables::of($Language)
            ->addColumn('action', function ($Language) {
                return
                    '<button class="btn btn-primary" data-toggle="modal" data-target="#LanguageStoreModal"
            onclick="LanguageEdit(' . $Language->id . ')">
            <i class="fa fa-edit"></i></button>
            <button class="btn btn-danger" onclick="LanguageRemove(' . $Language->id . ')"><i class="fa fa-trash"></i>
            </button>';
            })
            ->rawColumns(['action'])
            ->make(true);
    }
    public function LanguageEdit(Request $request)
    {
        $lang_id = $request->input('id');
        $Language = Language::where('id', $lang_id)->get();
        return response()->json(["data" => $Language]);
    }
    public function LanguageDestroy(Request $req)
    {
        $Language = Language::where('id', $req->input('id'))->delete();

        if ($Language) {
            return response()->json(['success' => true, 'message' => 'Language Deleted Successfully']);
        } else {
            return response()->json(['success' => false, 'message' => 'Delete Failed..!']);
        }
    }
}
