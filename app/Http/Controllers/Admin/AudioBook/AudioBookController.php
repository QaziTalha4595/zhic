<?php

namespace App\Http\Controllers\Admin\AudioBook;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Language;
use App\Models\AudioBook\AudioBook;
use App\Models\Ebook\Ebook;
use App\Models\Ebook\Ebook__Cover;
use App\Models\Ebook\Ebook__Audio;
use App\Models\AudioBook\AudioBook_Cover;
use Yajra\Datatables\Datatables;
use App\Models\FetchThirdCategory;
use Illuminate\Support\Carbon;
use DB;

class AudioBookController extends Controller
{
    public function AudioBook()
    {
        $Category = Category::all();
        return view('Admin.AudioBook.AudioBook',compact('Category'));
    }
    public function AudioBookBasicTab()
    {
        $Category = Category::all();
        $Languages = Language::all();
        return view('Admin.AudioBook.AudioBookBasicTab',compact('Category','Languages'));

    }
    public function AudioBookShow(Request $req)
    {

        if ($req->ajax()) {
            if ($req->input('from_date') && $req->input('to_date')) {
                $AudioBook = Ebook::whereBetween('created_at', [$req->input('from_date'), $req->input('to_date')])
                                ->where('book_type', 1)
                                ->with(['category','subcategory','ebookaudio'])
                                ->get();
            }
            else if($req->input('category_name') && $req->input('sub_category_name'))
            {
                $AudioBook = Ebook::where('category_id',$req->input('category_name'))
                                                ->where('book_type', 1)
                                                ->where('sub_cat_id',$req->input('sub_category_name'))
                                                ->with(['category','subcategory','ebookaudio'])
                                                ->get();
            }
            else if ($req->input('category_name') || $req->input('sub_category_name')) {
                $AudioBook = Ebook::where('category_id',$req->input('category_name'))
                                                ->where('book_type', 1)
                                                ->orwhere('sub_cat_id',$req->input('sub_category_name'))
                                                ->with(['category','subcategory','ebookaudio'])
                                                ->get();
            }

            else {
                $AudioBook = Ebook::with(['category','subcategory','ebookaudio'])->where('book_type', 1)->get();
            }
        }



        return Datatables::of($AudioBook)
        ->editColumn('created_at', function ($ThirdCategory) {
            $formatedDate = Carbon::createFromFormat('Y-m-d H:i:s', $ThirdCategory->created_at)->format('d-m-Y');
            return $formatedDate;
        })
            ->addColumn('Action', function ($AudioBook) {
                return $AudioBook->file_id;
            })
            ->rawColumns(['Action'])
            ->make(true);
    }
    public function AudioBookBasicInfoStore(Request $req)
    {
        $Ebook = new Ebook();
        $validator = Validator::make($req->all(), [
            'category_id' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'sub_cat_id' => 'required',
            'third_category_id' => $req->input('file_id') ? '' : 'required',
            'language_id' => 'required',
            'audio_book_name' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'audio_book_isbn' => 'required|regex:/^[0-9]+$/u',
            'audio_book_author_name' => 'required',
            'audio_book_notes' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'audio_book_publisher' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'audio_book_publishing_date' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'
        ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        $unique_id = strtoupper(substr(str_shuffle(uniqid() . "0123456789abcdefghijklmnopqrstvwxyz" . mt_rand(99, 999999)), 0, 20));

        $slug = str_replace(" ", "_", $req->input('audio_book_name'));

        try {

            $Ebook = Ebook::updateOrCreate(
            ['file_id'=> $req->input('file_id')],
            [
                'unique_id' => $unique_id,
                'ebook_slug' => $slug,
                'category_id' => $req->input('category_id'),
                'sub_cat_id' => $req->input('sub_cat_id'),
                'third_cat_id' => $req->input('third_category_id'),
                'language_id' => $req->input('language_id'),
                'ebook_name' => $req->input('audio_book_name'),
                'ebook_isbn' => $req->input('audio_book_isbn'),
                'ebook_author' => $req->input('audio_book_author_name'),
                'ebook_note' => $req->input('audio_book_notes'),
                'ebook_publisher' => $req->input('audio_book_publisher'),
                'publishing_date' => $req->input('audio_book_publishing_date'),
                'direction' => $req->input('direction'),
                'printable' => $req->input('printable') == "" ? 0 : 1,
                'searchable' => $req->input('searchable') == "" ? 0 : 1,
                'book_type' => $req->input('book_type') == "" ? 1 : 1,
                'featured' => $req->input('featured') == "" ? 0 : 1
            ]
            );


            if ($Ebook) {
                return response()->json(["success" => true, "message" => $Ebook->wasRecentlyCreated ? "Audio Book Create Successfully" : "Audio Book Updated Successfully", "file_id" => $Ebook->file_id ]);
            } else {
                return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
            }
        } catch (\Throwable $th) {
            return $th;
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }
    }
    public function AudioBookCoverImageView($file_id)
    {
        $AudiBook__Cover = new Ebook__Cover();

        $AudioBook = Ebook::where('file_id', $file_id)->get();

        $AudioBook_Cover = Ebook__Cover::where('file_id', $file_id)->get();
        return view('Admin.AudioBook.AudioBookCoverImage',['data' => $AudioBook_Cover, 'file_id' => $file_id, 'files' => $AudioBook_Cover]);
    }
    ///////////////////////////////////Audio Boook Function ----------------------


    public function AudioBookCoverImageStore(Request $req)
    {
        $Files = Ebook::with(['ebookcover'])->where('file_id', $req->input('file_id'))->get();

        $row = $Files[0];

         $validator = Validator::make($req->all(), [

            'audio_book_position' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'audio_book_bg_color' => 'required',
            'audio_book_cover' => $req->input('file_id') ? 'mimes:jpeg,jpg,png,gif|max:10000' : 'required|mimes:jpeg,jpg,png,gif|max:10000'
            ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        if ($req->hasfile('audio_book_cover'))
        {

                $imageNameWithExt = $req->file('audio_book_cover')->getClientOriginalName();
                $imageName = pathinfo($imageNameWithExt, PATHINFO_FILENAME);
                $new_name = str_replace(" ", "_", strtolower($imageName));
                $new_name = strtolower($imageName);
                $extension = $req->file('audio_book_cover')->extension();
                $imageThumbnail = mt_rand(100, 99999) . '_' . $imageNameWithExt;
                $Image = $req->file('audio_book_cover')->move('public/Files/Audio-Book-Cover/', $imageThumbnail);

                $findImage = Ebook__Cover::where('ebook__cover_id',$req->input('audio_book_cover_id'))->first();
                if(!empty($findImage->ebook_cover) && file_exists('public/Files/Audio-Book-Cover/'.$findImage->ebook_cover))
                {
                    unlink('public/Files/Audio-Book-Cover/'.$findImage->ebook_cover);
                }

        }
        else
            {
                $imageThumbnail = $row->ebook_cover->ebook_cover ?? '';
            }
        try {

            if(!$imageThumbnail){
                $data = [
                    'ebook_position' => $req->input('audio_book_position'),
                    'file_id' => $req->input('file_id'),
                    'ebook_bg_color' => $req->input('audio_book_bg_color')
                ];
            }else{
                $data = [
                    'ebook_position' => $req->input('audio_book_position'),
                    'file_id' => $req->input('file_id'),
                    'ebook_bg_color' => $req->input('audio_book_bg_color'),
                    'ebook_cover' => $imageThumbnail
                ];
            }

            $Ebook__cover = Ebook__Cover::updateOrCreate(

                ['ebook__cover_id' => $req->input('audio_book_cover_id')],
              $data
            );
            if($Ebook__cover) {
                //return response()->json(["success" => true, "message" => $AudioBook_Cover->wasRecentlyCreated ? "Ebook Cover Create Successfully" : "Ebook Cover Updated Successfully", "file_id" => $Ebook_cover->file_id]);
                 return response()->json(['success' => true, 'file_id' => $req->input('file_id'), 'message' => 'Data has been uploaded successfully']);
            } else {
                return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
            }
        } catch (\Throwable $th) {
            return $th->getMessage();
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }
    }
    public function AudioBookFileUpload(Request $request, $file_id)
    {
        $Ebook = Ebook::with(['ebookaudio'])->where('file_id',$file_id)->get();
        return view("Admin.AudioBook.AudioBookUpload",["data" => $Ebook[0], 'file_id' => $file_id, 'files' => $Ebook]);
    }

    public function AudioStore(Request $req)
    {
        $Files = Ebook::with(['ebookaudio'])->where('file_id', $req->input('file_id'))->get();
        $row = $Files[0];
        $validator = Validator::make($req->all(), [
            // mimes:audio/mpeg3
            'audio_attachment' => $req->input('file_id') ? '' : 'required|audio/mpeg3',
            'audio_title' => $req->input('file_id') ? '' : 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'
            // 'audio_title_in_arabic' => $req->input('file_id') ? '' : 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'
        ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }

        if ($req->hasfile('audio_attachment'))
        {
                $imageNameWithExt = $req->file('audio_attachment')->getClientOriginalName();
                $imageName = pathinfo($imageNameWithExt, PATHINFO_FILENAME);
                $new_name = str_replace(" ", "_", strtolower($imageName));
                $new_name = strtolower($imageName);
                $extension = $req->file('audio_attachment')->extension();
                $imageThumbnail = mt_rand(100, 99999) . '_' . $imageNameWithExt;
                $Image = $req->file('audio_attachment')->move('public/Files/Audio_Book/', $imageThumbnail);

                $findImage = Ebook__Audio::where('audio_id',$req->input('audio_attachment_id'))->first();
                if(!empty($findImage->audio_file) && file_exists('public/Files/Audio_Book/'.$findImage->audio_file))
                {
                    unlink('public/Files/Audio_Book/'.$findImage->audio_file);
                }
        }
        else
        {
            $imageThumbnail = $row->audio_file;
        }
        try {

            if(!$imageThumbnail){
                $data = [
                    'audio_title' => $req->input('audio_title'),
                    'file_id' => $req->input('file_id')
                ];
            }else{
                $data = [
                    'audio_title' => $req->input('audio_title'),
                    'file_id' => $req->input('file_id'),
                    'audio_link' => $Image,
                    'audio_file' => $imageThumbnail
                ];
            }

            $Audio_File_Upload = Ebook__Audio::updateOrCreate(
               ['audio_id' => $req->input('audio_attachment_id')],
              $data
            );
            if($Audio_File_Upload) {
                 return response()->json(['success' => true, 'file_id' => $req->input('file_id'), 'message' => 'Data has been uploaded successfully']);
            } else {
                return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
            }
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }



    }
    public function AudioBookBasicForEdit($file_id)
    {
        $AudioBookForEdit = Ebook::with(['category','subcategory','thirdcategory','language'])->find($file_id);
        $Category = Category::all();
        $Languages = Language::all();
        return view('Admin.AudioBook.AudioBookBasicTab',["data" => $AudioBookForEdit, 'file_id' => $file_id,'Category' => $Category, 'Languages' => $Languages]);
        // return view("Admin.Ebook.EbookBasicTab", ['data' => $Ebook, 'file_id' => $file_id, 'Languages' => $Languages, 'Category'=>$Category]);
    }
    public function AudioBookRemove(Request $req)
    {
        $findImage = Ebook__Cover::where('file_id',$req->input('id'))->get();

            foreach ($findImage as $row) {

            if(!empty($row->ebook_cover) && file_exists('public/Files/Audio-Book-Cover/'.$row->ebook_cover))
            {
                unlink('public/Files/Audio-Book-Cover/'.$row->ebook_cover);
            }

        }

        $findImage = Ebook__Audio::where('file_id',$req->input('id'))->get();

        foreach ($findImage as $row) {

        if(!empty($row->audio_file) && file_exists('public/Files/Audio_Book/'.$row->audio_file))
        {
            unlink('public/Files/Audio_Book/'.$row->audio_file);
        }

    }

        Ebook__Cover::where('file_id',$req->input('id'))->delete();
        Ebook__Audio::where('file_id',$req->input('id'))->delete();

        $data = Ebook::where('file_id',$req->input('id'))->delete();
        if($data)
        {
            return response()->json(['success' => true, 'message' => 'Audio Book Remove Successfully']);
        }
        else
        {
            return response()->json(['success' => false, 'message' => 'Remove Failed..!']);
        }
    }
    public function AudioBookCoverImageRemove(Request $request)
    {
        $Image = Ebook__Cover::where('ebook__cover_id',$request->input('audio_book_cover_id'))->first();
        if(file_exists('public/Files/Audio-Book-Cover/' . $Image->ebook_cover) AND !empty($Image->ebook_cover))
        {
            unlink('public/Files/Audio-Book-Cover/'.$Image->ebook_cover);
        }

        $data = Ebook__Cover::where('ebook__cover_id',$request->input('audio_book_cover_id'))->delete();
        if($data)
        {
            return response()->json(['success' => true, 'message' => 'Audio Book Cover Remove Successfully']);
        }
        else
        {
            return response()->json(['success' => false, 'message' => 'Remove Failed..!']);
        }
    }
    public function AudioBookFileRemove(Request $request)
    {
        $AudioBook = Ebook::find($request->input('audio_book_id'));

        $Image = Ebook__Audio::where('audio_id',$request->input('audio_book_id'))->first();
        if(file_exists('public/Files/Audio_Book/' .$Image->audio_file) AND !empty($Image->audio_file))
        {
            unlink('public/Files/Audio_Book/'.$Image->audio_file);
        }
        $data = Ebook__Audio::where('audio_id',$request->input('audio_book_id'))->delete();

        if($data)
        {
            return response()->json(['success' => true, 'message' => 'File Remove Successfully']);
        }
        else
        {
            return response()->json(['success' => false, 'message' => 'Remove Failed..!']);
        }
    }
    public function AudioBookEdit(Request $request)
    {
        $Ebook_Cover_id = $request->input('ebook_cover_id');
        $Ebook_Cover = Ebook__Cover::where('ebook__cover_id', $Ebook_Cover_id)->get();
        return response()->json(["data" => $Ebook_Cover]);
    }
    public function GetAudioFile(Request $req)
    {
        $Audio_File = Ebook__Audio::where('file_id', $req->input('file_id'))->orderBy('audio_id','DESC')->get();

        return response()->json(["data"=> $Audio_File]);
    }
    public function AudioEdit(Request $request)
    {
        $Audio_id = $request->input('audio_id');

        $Audio = Ebook__Audio::where('audio_id', $Audio_id)->get();

        return response()->json(["data" => $Audio]);
    }

}
