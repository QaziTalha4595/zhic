<?php

namespace App\Http\Controllers\Admin\Ebook;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\ThirdCategory;
use App\Models\Language;
use App\Models\Ebook\Ebook;
use App\Models\Book_Shelf;
use App\Models\Ebook\Ebook__Cover;
use App\Models\Ebook\Ebook_location;
use Yajra\Datatables\Datatables;
use App\Models\FetchThirdCategory;
use App\Models\Feedback\feedback;
use Illuminate\Support\Carbon;
use DB;


class EbookController extends Controller
{
    public function Ebook()
    {
        $categories = Category::all();
        return view('Admin.Ebook.Ebook',compact('categories'));
    }

    public function EbookUpload()
    {
        $Category = Category::all();
        $Languages = Language::all();
        return view('Admin.Ebook.EbookBasicTab', compact('Category', 'Languages'));
    }

    public function FetchThirdCategory(Request $req)
    {
        $Thirdcategory = new Thirdcategory();
        $ThirdCategory['third_categories'] = ThirdCategory::where('sub_category_id', $req->third_cat_id)->get();
        return response()->json(["data" => $ThirdCategory]);
    }
    public function EbookStore(Request $req)
    {
        $Ebook = new Ebook();

        $validator = Validator::make($req->all(), [
            'category_id' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'sub_category_id' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'third_category_id' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'language_id' => 'required',
            'ebook_name' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'ebook_publisher' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'publishing_date' => 'required',
            'ebook_isbn' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'ebook_author' => 'required',
            'ebook_note' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'
        ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        $unique_id = strtoupper(substr(str_shuffle(uniqid() . "0123456789abcdefghijklmnopqrstvwxyz" . mt_rand(99, 999999)), 0, 20));

        $slug = str_replace(" ", "_", $req->input('ebook_name'));
        try {

            $Ebook = Ebook::updateOrCreate(
                ['file_id'=> $req->input('file_id')],
                [
                    'unique_id' => $unique_id,
                    'category_id' => $req->input('category_id'),
                    'sub_cat_id' => $req->input('sub_category_id'),
                    'third_cat_id' => $req->input('third_category_id'),
                    'language_id' => $req->input('language_id'),
                    'ebook_name' => $req->input('ebook_name'),
                    'ebook_isbn' => $req->input('ebook_isbn'),
                    'ebook_author' => $req->input('ebook_author'),
                    'ebook_note' => $req->input('ebook_note'),
                    'ebook_publisher' => $req->input('ebook_publisher'),
                    'publishing_date' => $req->input('publishing_date'),
                    'direction' => $req->input('direction'),
                    'ebook_slug' => $slug,
                    'downloadable' => $req->input('downloadable') == "" ? 0 : 1,
                    'printable' => $req->input('printable') == "" ? 0 : 1,
                    'searchable' => $req->input('searchable') == "" ? 0 : 1,
                    'featured' => $req->input('featured') == "" ? 0 : 1
                ]
            );
            if ($Ebook) {
                return response()->json(["success" => true, "message" => $Ebook->wasRecentlyCreated ? "Ebook Create Successfully" : "Ebook Updated Successfully", "file_id" => $Ebook->file_id]);
            } else {
                return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
            }
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }
    }
    public function EbookShow(Request $req)
    {
        if ($req->ajax()) {
            if ($req->input('from_date') && $req->input('to_date')) {
                $Ebook = Ebook::whereBetween('created_at', [$req->input('from_date'), $req->input('to_date')])
                                ->where('book_type',0)
                                ->with(['category','subcategory','thirdcategory','ebookcover'])
                                ->get();

            }
            else if($req->input('category_name'))
            {
                $Ebook = Ebook::where('category_id',$req->input('category_name'))
                                ->where('book_type',0)
                                ->with(['category','subcategory','thirdcategory','ebookcover'])
                                ->get();

            }
            else if ($req->input('from_date') || $req->input('to_date')) {

                $Ebook = Ebook::whereDate('created_at', [$req->input('from_date')])
                                ->orwhereDate('created_at', [$req->input('to_date')])
                                ->where('book_type',0)
                                ->with(['category','subcategory','thirdcategory','ebookcover'])
                                ->get();

            } else {
                $Ebook = Ebook::where('book_type',0)
                                ->with(['category','subcategory','thirdcategory','ebookcover'])
                                ->get();
            }
        }
        return Datatables::of($Ebook)
            // ->addColumn('file_read', function ($Ebook) {
            //     return '<a type="button" onclick="FileRead(' . $Ebook->unique_id . ')" class="">' . $Ebook->unique_id . '</a>';
            // })
            ->editColumn('created_at', function ($SubCategories) {
                $formatedDate = Carbon::createFromFormat('Y-m-d H:i:s', $SubCategories->created_at)->format('d-m-Y');
                return $formatedDate;
            })
            ->addColumn('action', function ($Ebook) {
                return $Ebook->file_id;
            })
            ->rawColumns(['action'])
            ->make(true);
    }
    public function EbookBasicView($file_id)
    {
        $Ebook = Ebook::with('category','subcategory','thirdcategory','language')->find($file_id);


        $Category = Category::all();
        $Languages = Language::all();
        // return $Ebook->ebook_name;
        return view("Admin.Ebook.EbookBasicTab", ['data' => $Ebook, 'file_id' => $file_id, 'Languages' => $Languages, 'Category'=>$Category]);
    }

    public function EbookCoverImageView($file_id)
    {
        $Ebook__Cover = new Ebook__Cover();

        $Ebook = Ebook::where('file_id', $file_id)->get();

        return view("Admin.Ebook.Ebook_CoverTab", ['data' => $Ebook, 'file_id' => $file_id]);
    }
    public function GetEbookCoverImage(Request $req)
    {
        $Ebook__Cover = Ebook__Cover::where('file_id', $req->input('file_id'))->orderBy('ebook__cover_id','DESC')->get();

        return response()->json(["data"=> $Ebook__Cover]);
    }
    public function EbookCoverStore(Request $req)
    {
        $Files = Ebook::with(['ebookcover'])->where('file_id', $req->input('file_id'))->get();

        $row = $Files[0];
        $validator = Validator::make($req->all(), [
            'ebook_position' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'ebook_bg_color' =>  'required',
            'ebook_cover' => $req->input('ebook_attachment_id') ? 'mimes:jpeg,jpg,png,gif|max:10000' : 'required|mimes:jpeg,jpg,png,gif|max:10000'
            ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }

        if ($req->hasfile('ebook_cover'))
        {
                $imageNameWithExt = $req->file('ebook_cover')->getClientOriginalName();
                $imageName = pathinfo($imageNameWithExt, PATHINFO_FILENAME);
                $new_name = str_replace(" ", "_", strtolower($imageName));
                $new_name = strtolower($imageName);
                $extension = $req->file('ebook_cover')->extension();
                $imageThumbnail = mt_rand(100, 99999) . '_' . $imageNameWithExt;
                $Image = $req->file('ebook_cover')->move('public/Files/E_Book_CoverImg/', $imageThumbnail);

                $findImage = Ebook__Cover::where('ebook__cover_id',$req->input('ebook_attachment_id'))->first();
                if(!empty($findImage->ebook_cover) && file_exists('public/Files/E_Book_CoverImg/'.$findImage->ebook_cover))
                {
                    unlink('public/Files/E_Book_CoverImg/'.$findImage->ebook_cover);
                }

        }
        else
            {
                $imageThumbnail = $row->ebook_cover;
            }
        try {

            if(!$imageThumbnail){
                $data = [
                    'ebook_position' => $req->input('ebook_position'),
                    'file_id' => $req->input('file_id'),
                    'ebook_bg_color' => $req->input('ebook_bg_color')
                ];
            }else{
                $data = [
                    'ebook_position' => $req->input('ebook_position'),
                    'file_id' => $req->input('file_id'),
                    'ebook_bg_color' => $req->input('ebook_bg_color'),
                    'ebook_cover' => $imageThumbnail
                ];
            }


            $Ebook_cover = Ebook__Cover::updateOrCreate(
                ['ebook__cover_id' => $req->input('ebook_attachment_id')],
              $data
            );
            if($Ebook_cover) {
                //return response()->json(["success" => true, "message" => $Ebook_cover->wasRecentlyCreated ? "Ebook Cover Create Successfully" : "Ebook Cover Updated Successfully", "file_id" => $Ebook_cover->file_id]);
                 return response()->json(['success' => true, 'file_id' => $req->input('file_id'), 'message' => 'Data has been uploaded successfully']);
            } else {
                return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
            }
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }



    }
    public function EbookRemove(Request $req)
    {
        $Image = Ebook::where('file_id',$req->input('id'))->first();

            if(!empty($Image->ebook_audio) && file_exists('public/Files/E-Book-Audio/'.$Image->ebook_audio))
            {
                unlink('public/Files/E-Book-Audio/'.$Image->ebook_audio);
                unlink('public/Files/E-Book/'.$Image->ebook_attachment);

                $findImage = Ebook__Cover::where('file_id',$req->input('id'))->get();

                foreach ($findImage as $row) {

                if(!empty($row->ebook_cover) && file_exists('public/Files/E_Book_CoverImg/'.$row->ebook_cover))
                {
                    unlink('public/Files/E_Book_CoverImg/'.$row->ebook_cover);
                }

            }
        }
        Ebook__Cover::where('file_id',$req->input('id'))->delete();
        Book_Shelf::where('file_id',$req->input('id'))->delete();
        Ebook_location::where('file_id',$req->input('id'))->delete();
        feedback::where('file_id',$req->input('id'))->delete();
        $data = Ebook::where('file_id',$req->input('id'))->delete();

        if($data)
        {
            return response()->json(['success' => true, 'message' => 'Ebook Remove Successfully']);
        }
        else
        {
            return response()->json(['success' => false, 'message' => 'Remove Failed..!']);
        }
    }
    public function EbookCoverImageRemove(Request $request)
    {

        $Image = Ebook__Cover::where('ebook__cover_id',$request->input('ebook__cover_id'))->first();
        if(file_exists('public/Files/E_Book_CoverImg/' . $Image->ebook_cover) AND !empty($Image->ebook_cover))
        {
            unlink('public/Files/E_Book_CoverImg/'.$Image->ebook_cover);
        }

        $data = Ebook__Cover::where('ebook__cover_id',$request->input('ebook__cover_id'))->delete();
        if($data)
        {
            return response()->json(['success' => true, 'message' => 'Ebook Cover Remove Successfully']);
        }
        else
        {
            return response()->json(['success' => false, 'message' => 'Remove Failed..!']);
        }
    }
    public function EbookCoverUploadView(Request $request, $file_id)
    {
        // $data = DB::table('ebook')
        //     ->where('file_id', $file_id)
        //     ->get();
        $Ebook = Ebook::where('file_id',$file_id)->get();
        return view("Admin.Ebook.Ebook_UploadTab", ['data' => $Ebook[0], 'file_id' => $file_id]);
    }
    public function EbookUploadStore(Request $req)
    {
        $Ebook = Ebook::find($req->input('file_id'));

        $validator = Validator::make($req->all(), [

            'ebook_attachment' => $req->input('file_id') ? 'mimes:doc,pdf,docx' : 'required|mimes:doc,pdf,docx',
            'ebook_link' => $req->input('file_id') ? '' : 'required|mimes:doc,pdf,docx',
            'ebook_audio' => $req->input('file_id') ? 'mimes:audio,mp3' : 'required|audio/mpeg'
            ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }

        $imageNameWithExt = $imageName = $new_name = $imageNameToStore = $Downloadable = $PrintableEbook = "";
        if ($req->hasFile('ebook_attachment'))
        {
            $imageNameWithExt = $req->file('ebook_attachment')->getClientOriginalName();
            $imageName = pathinfo($imageNameWithExt, PATHINFO_FILENAME);
            $new_name = str_replace(" ", "_", strtolower($imageName));
            $extension = $req->file('ebook_attachment')->getClientOriginalExtension();
            $imageNameToStore = substr(str_shuffle("0123456789"), 0, 11).'.'.$extension;
            $Image = $req->file('ebook_attachment')->move('public/Files/E-Book/', $imageNameToStore);

            if($req->input('file_id'))
                {
                    $findImage = Ebook::where('file_id',$req->input('file_id'))->first();
                    if (file_exists('public/Files/E-Book/' . $Ebook->ebook_attachment) AND !empty($findImage->ebook_attachment)) {
                        unlink('public/Files/E-Book/' . $Ebook->ebook_attachment);
                    }
                }

        }
        else
        {
            $data = Ebook::where('file_id',$req->input('file_id'))->first();
            $imageNameToStore = $data->ebook_attachment;
        }
        if ($req->hasFile('printable'))
        {
            $imageNameWithExt = $req->file('printable')->getClientOriginalName();
            $imageName = pathinfo($imageNameWithExt, PATHINFO_FILENAME);
            $new_name = str_replace(" ", "_", strtolower($imageName));
            $extension = $req->file('printable')->extension();
            $PrintableEbook = substr(str_shuffle("0123456789"), 0, 11) . mt_rand(100, 99999) . '.' . $extension;
            $Image = $req->file('printable')->move('public/Files/E-Book/', $PrintableEbook);

            if($req->input('file_id'))
            {
                $findImage = Ebook::where('file_id',$req->input('file_id'))->first();
                if (file_exists('public/Files/E-Book/' . $Ebook->p_r_ebook) AND !empty($findImage->p_r_ebook)) {
                    unlink('public/Files/E-Book/' . $Ebook->p_r_ebook);
                }
            }
        }
        else
        {
            $data = Ebook::where('file_id',$req->input('file_id'))->first();
            $PrintableEbook = $data->p_r_ebook;
        }
        if ($req->hasFile('ebook_audio')) {
            $imageNameWithExt = $req->file('ebook_audio')->getClientOriginalName();
            $imageName = pathinfo($imageNameWithExt, PATHINFO_FILENAME);
            $new_name = str_replace(" ", "_", strtolower($imageName));
            $extension = $req->file('ebook_audio')->extension();
            $Ebook_Audio = substr(str_shuffle("0123456789"), 0, 11) . mt_rand(100, 99999) . '.' . $extension;
            $Image = $req->file('ebook_audio')->move('public/Files/E-Book-Audio/', $Ebook_Audio);

            if($req->input('file_id'))
            {
                $findImage = Ebook::where('file_id',$req->input('file_id'))->first();
                if (file_exists('public/Files/E-Book-Audio/' . $Ebook->ebook_audio) AND !empty($findImage->ebook_audio)) {
                    unlink('public/Files/E-Book-Audio/' . $Ebook->ebook_audio);
                }
            }
        }
        else
        {
            $data = Ebook::where('file_id',$req->input('file_id'))->first();
            $Ebook_Audio = $data->ebook_audio;
        }

        $Ebook->ebook_attachment = $imageNameToStore;
        $Ebook->ebook_link =  $req->input('ebook_link');
        $Ebook->p_r_ebook = $PrintableEbook;
        $Ebook->ebook_audio = $Ebook_Audio;

        if($Ebook->save()) {
            return response()->json(["success" => true, "message" => "Ebook Uploaded Successfully", "file_id" => $Ebook->file_id]);
            // return response()->json(['success' => true, 'file_id' => $req->input('file_id'), 'message' => 'Data has been uploaded successfully']);
        } else {
            return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
        }

    }
    public function EbookEdit(Request $request)
    {
        $Ebook_Cover_id = $request->input('ebook_cover_id');
        $Ebook_Cover = Ebook__Cover::where('ebook__cover_id', $Ebook_Cover_id)->get();
        return response()->json(["data" => $Ebook_Cover]);
    }
    public function EbookView(Report $req)
    {
        $Ebook = Ebook::with(['category','subcategory','thirdcategory','ebookcover'])->where('book_type',0)->OrderBy('file_id','DESC');

        return Datatables::of($Ebook)
            ->addColumn('Category', function ($e) {
                return $e->category->category_name;
            })
            ->addColumn('SubCategory', function ($e) {
                return $e->subcategory->sub_category_name;
            })
            ->addColumn('ThirdCategory', function ($e) {
                return $e->thirdcategory->third_category_name;
            })
            ->addColumn('Thumbnail', function ($e) {
                return $e->ebookcover->ebook_cover ?? '';
            })
            ->addColumn('Action', function ($e) {
                return $e->file_id ;
            })
            ->addColumn('file_read', function ($Ebook) {
                return '<a type="button" onclick="FileRead(' . $Ebook->unique_id . ')" class="">' . $Ebook->unique_id . '</a>';
            })
            ->rawColumns(['Action', 'file_read'])
            ->make(true);
    }
    public function AllBookShow(Request $req)
    {
        if ($req->ajax()) {
            if ($req->input('from_date') && $req->input('to_date')) {
                $Ebook = Ebook::whereBetween('created_at', [$req->input('from_date'), $req->input('to_date')])
                                ->with(['category','subcategory','thirdcategory','ebookcover'])
                                ->get();

            }
            else if($req->input('category_name'))
            {
                $Ebook = Ebook::where('category_id',$req->input('category_name'))
                                ->with(['category','subcategory','thirdcategory','ebookcover'])
                                ->get();

            }
            else if ($req->input('from_date') || $req->input('to_date')) {

                $Ebook = Ebook::whereDate('created_at', [$req->input('from_date')])
                                ->orwhereDate('created_at', [$req->input('to_date')])
                                ->with(['category','subcategory','thirdcategory','ebookcover'])
                                ->get();

            } else {
                $Ebook = Ebook::with(['category','subcategory','thirdcategory','ebookcover'])
                                ->get();
            }
        }
        return Datatables::of($Ebook)
            // ->addColumn('file_read', function ($Ebook) {
            //     return '<a type="button" onclick="FileRead(' . $Ebook->unique_id . ')" class="">' . $Ebook->unique_id . '</a>';
            // })
            ->editColumn('created_at', function ($SubCategories) {
                $formatedDate = Carbon::createFromFormat('Y-m-d H:i:s', $SubCategories->created_at)->format('d-m-Y');
                return $formatedDate;
            })
            ->addColumn('action', function ($ThirdCategory) {
            })
            ->rawColumns(['action'])
            ->make(true);
    }


}
