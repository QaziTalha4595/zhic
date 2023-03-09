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
use App\Models\Ebook\Ebook__Cover;
use Yajra\Datatables\Datatables;
use App\Models\FetchThirdCategory;

class EbookController extends Controller
{
    public function Ebook()
    {
        return view('Admin.Ebook.Ebook');
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
            'sub_category_id' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'language_id' => 'required',
            'ebook_name' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'ebook_isbn' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'ebook_author' => 'required',
            'ebook_note' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'ebook_publisher' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u',
            'publishing_date' => 'required',
            'slug' => 'required|regex:/^[a-zA-Z_ 0-9&_\.-]+$/u'
        ]);
        if ($validator->fails()) {
            return response()->json(["validate" => true, "message" => $validator->errors()->all()[0]]);
        }
        try {

            $Ebook = Ebook::updateOrCreate(

                ['file_id'   => $req->input('file_id')],
                [
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
                    'ebook_slug' => $req->input('slug'),
                    'downloadable' => $req->input('downloadable') == "" ? 0 : 1,
                    'printable' => $req->input('printable') == "" ? 0 : 1,
                    'searchable' => $req->input('searchable') == "" ? 0 : 1,
                    'featured' => $req->input('featured') == "" ? 0 : 1
                ]
            );
            if ($Ebook) {
                return response()->json(["success" => true, "message" => $Ebook->wasRecentlyCreated ? "Ebook Create Successfully" : "Ebook Updated Successfully", 'file_id' => $Ebook->file_id]);
            } else {
                return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
            }
        } catch (\Throwable $th) {
            return response()->json(["success" => false, "message" => "Opps an Error Occured", "err" => $th]);
        }
    }
    public function EbookBasicView($file_id)
    {
        $Ebook = Ebook::where('file_id', $file_id)->get();
        $language = Language::all();
        return view("Admin.Ebook.EbookBasicTab", ['data' => $Ebook, 'file_id' => $file_id, 'languages' => $language]);
    }
    public function EbookCoverImageView($file_id)
    {
        $Ebook__Cover = new Ebook__Cover();

        $Ebook = Ebook::where('file_id', $file_id)->get();

        $Ebook__Cover = Ebook__Cover::where('file_id', $file_id)->get();

        return view("Admin.Ebook.Ebook_CoverTab", ['data' => $Ebook, 'file_id' => $file_id, 'files' => $Ebook__Cover]);
    }
    public function EbookCoverStore(Request $req)
    {

        $Files = Ebook::where('file_id', $req->input('file_id'))->get();
        if ($req->hasfile('file_thumbnail')) {

                $imageNameWithExt = $req->file('file_thumbnail')->getClientOriginalName();
                $imageName = pathinfo($imageNameWithExt, PATHINFO_FILENAME);
                $new_name = str_replace(" ", "_", strtolower($imageName));
                $new_name = strtolower($imageName);
                $extension = $req->file('file_thumbnail')->extension();
                $imageThumbnail = mt_rand(100, 99999) . '_' . $imageNameWithExt;
                $Image = $req->file('file_thumbnail')->move('public/Files/E_Book_CoverImg/', $imageThumbnail);

                $Ebook_Cov = Ebook__Cover::create([

                    'file_id' => $req->input('file_id'),
                    'ebook_position' => $req->input('ebook_position'),
                    'ebook_bg_color' => $req->input('ebook_bg_color'),
                    'ebook__cover' => $imageThumbnail
                ]);
        }    
        if($Ebook_Cov) {
            return response()->json(['success' => true, 'file_id' => $req->input('file_id'), 'message' => 'Data has been uploaded successfully']);
        } else {
            return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
        }
       
    
    }
    public function EbookCoverImageRemove(Request $request)
    {
        // $FileImg = DB::table('ebook__cover')
        //     ->where('ebook__cover_id', $request->input('ebook__cover_id'))
        //     ->get();
        $FileImg = Ebook__Cover::where('ebook__cover_id',$request->input('ebook__cover_id'))->get();    

        if (count($FileImg) > 0) {
            foreach ($FileImg as $Image) {
                $Thumbnail = url('/') . 'public/Files/E-Book-CoverImg/' . $Image->ebook__cover;
                if (file_exists('public/Files/E-Book-CoverImg/' . $Image->ebook__cover)) {
                    $deleted = unlink('public/Files/E-Book-CoverImg/' . $Image->ebook__cover);
                }
            }
        }
        $FileImgremoved =  Ebook__Cover::where('ebook__cover_id',$request->input('ebook__cover_id'))->delete();    


        if ($FileImgremoved) {
            return response()->json(['success' => true, 'message' => 'Ebook Cover Image has been removed successfully']);
        } else {
            return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);
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
        // dd($Ebook);
        // return false;
        // $Ebook = Ebook::where('file_id',$req->input('file_id'))->get();
        // $row = $Ebook[0];

        $imageNameWithExt = $imageName = $new_name = $imageNameToStore = $Downloadable = $PrintableEbook = "";
        if ($req->hasFile('ebook_attachment')) {
            $imageNameWithExt = $req->file('ebook_attachment')->getClientOriginalName();
            $imageName = pathinfo($imageNameWithExt, PATHINFO_FILENAME);
            $new_name = str_replace(" ", "_", strtolower($imageName));
            $extension = $req->file('ebook_attachment')->extension();
            $imageNameToStore = substr(str_shuffle("0123456789"), 0, 11) . mt_rand(100, 99999) . '.' . $extension;
            $Image = $req->file('ebook_attachment')->move('public/Files/E-Book/', $imageNameToStore);

            $findImage = Ebook::where('file_id',$req->input('file_id'))->first();
            
            if (file_exists('public/Files/E-Book/' . $Ebook->ebook_attachment) AND !empty($findImage->ebook_attachment)) {
                unlink('public/Files/E-Book/' . $Ebook->ebook_attachment);
            }

        }
        else
        {
            $data = Ebook::where('file_id',$req->input('file_id'))->get();
            $imageNameToStore = $data[0];
            $imageNameToStore = $imageNameToStore->ebook_attachment;
        }
        if ($req->hasFile('printable')) {
            $imageNameWithExt = $req->file('printable')->getClientOriginalName();
            $imageName = pathinfo($imageNameWithExt, PATHINFO_FILENAME);
            $new_name = str_replace(" ", "_", strtolower($imageName));
            $extension = $req->file('printable')->extension();
            $PrintableEbook = substr(str_shuffle("0123456789"), 0, 11) . mt_rand(100, 99999) . '.' . $extension;
            $Image = $req->file('printable')->move('public/Files/E-Book/', $PrintableEbook);

            if (!empty($Ebook->p_r_ebook) and file_exists('public/Files/E-Book/' . $Ebook->p_r_ebook)) {
                unlink('public/Files/E-Book/' . $Ebook->p_r_ebook);
            }
        } else {
            $PrintableEbook = $Ebook->p_r_ebook;
        }
        if ($req->hasFile('ebook_audio')) {
            $imageNameWithExt = $req->file('ebook_audio')->getClientOriginalName();
            $imageName = pathinfo($imageNameWithExt, PATHINFO_FILENAME);
            $new_name = str_replace(" ", "_", strtolower($imageName));
            $extension = $req->file('ebook_audio')->extension();
            $Ebook_Audio = substr(str_shuffle("0123456789"), 0, 11) . mt_rand(100, 99999) . '.' . $extension;
            $Image = $req->file('ebook_audio')->move('public/Files/E-Book-Audio/', $Ebook_Audio);

            if (!empty($Ebook->ebook_audio) and file_exists('public/Files/E-Book/' . $Ebook->ebook_audio)) {
                unlink('public/Files/E-Book/' . $Ebook->ebook_audio);
            }
        } else {
            $Ebook_Audio = $Ebook->ebook_audio;
        }
            if($Ebook == "" || $Ebook != Ebook::find($req->input('file_id')))
            {

                return response()->json(['success' => false, 'message' => 'Failed..']);
            }
            else
            {
            $Ebook->ebook_attachment = $req->$imageNameToStore;
            $Ebook->p_r_ebook = $req->printable;
            $Ebook->ebook_audio = $req->ebook_audio;
            $Ebook->ebook_link = $req->ebook_link;
            $Ebook->ebook_download_link = $req->ebook_download_link;
        }
        if ($Ebook) 
        {
            return response()->json(['success' => true, 'file_id' => $req->input('file_id'), 'message' => 'Data has uploaded successfully']);
        } else {
            return response()->json(['success' => false, 'message' => 'Oops something went wrong, please check!']);

        }
    }

}
