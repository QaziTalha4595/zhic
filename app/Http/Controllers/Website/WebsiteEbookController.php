<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use DateTime;
use File;
use Response;

class WebsiteEbookController extends Controller
{
    public function Home(Request $req, $locale = 'en')
    {
        // app()->setLocale($locale);
        App::setLocale($locale);
        session()->put('locale', $locale);

        // dd($locale);


        $Categories = DB::table('category')->get();
        $Categories_sub = DB::table('category__sub')->get();
        $Categories_third = DB::table('category__third')->get();

        $books = DB::table('ebook')->get();
        $sliders = DB::table('sliders')->get();

        $bookshelf = DB::table('book_shelf')
            ->select('ebook.*', 'ebook__cover.*', 'book_shelf.*')
            ->leftjoin('ebook', 'ebook.file_id', 'book_shelf.file_id')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', 'ebook.file_id')
            ->orderby('book_shelf_id', 'ASC')
            ->get();

        $HolyQuraan = DB::table('ebook')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where('ebook.category_id', 1)
            ->where('ebook.featured', 1)
            ->limit(7)
            ->get();


        $MeaningofQuraan = DB::table('ebook')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where('ebook.category_id', 2)
            ->where('ebook.featured', 1)
            ->limit(5)
            ->get();

        $IslammicCultBook = DB::table('ebook')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where('ebook.category_id', 3)
            ->where('ebook.featured', 1)
            ->limit(4)
            ->get();
        $ArbicLearningBook = DB::table('ebook')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where('ebook.category_id', 4)
            ->where('ebook.featured', 1)
            ->limit(5)
            ->get();

        $ChildrenBook = DB::table('ebook')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where('ebook.category_id', 5)
            ->where('ebook.featured', 1)
            ->limit(6)
            ->get();

        $Article = DB::table('category__third')
            ->leftjoin('category__sub', 'category__sub.id', '=', 'category__third.sub_category_id')
            ->where('category__third.category_id', 6)
            ->groupBy('third_category_name')
            ->limit(6)
            ->get();

        return view('Website.Home', [
            'sliders' => $sliders,
            'Categories'=>$Categories,
            'Categories_sub'=>$Categories_sub,
            'Categories_third'=>$Categories_third,
            'books' => $books,
            'bookshelf' => $bookshelf,
            'HolyQuraan' => $HolyQuraan,
            'MeaningofQuraan' => $MeaningofQuraan,
            'IslammicCultBook' => $IslammicCultBook,
            'ChildrenBook' => $ChildrenBook,
            'ArbicLearningBook' => $ArbicLearningBook,
            'Article' => $Article,
            'locale' => $locale,
        ]);
    }

    public function BookDetail(Request $request, $locale = 'en', $slug)
    {


        App::setLocale($locale);
        session()->put('locale', $locale);


        $Categories = DB::table('category')->get();
        $Categories_sub = DB::table('category__sub')->get();
        $Categories_third = DB::table('category__third')->get();


        $promotion = DB::table('promotion')->get();
        $BookDetail = DB::table('ebook')
            ->where('ebook_slug', $slug)
            ->first();

            $BookDetail->covers = DB::table('ebook__cover')->where('file_id', $BookDetail->file_id)->get();
            $audios = DB::table('ebook__audios')
            ->where('file_id', $BookDetail->file_id)
            ->get();
            $BookDetails = DB::table('ebook')->get();
            $Audios = DB::table('ebook__audios')->get();

            $ArbicLearningBook = DB::table('ebook')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where('ebook.category_id', 4)
            ->where('ebook.featured', 1)
            ->limit(5)
            ->get();

            $bookshelf = DB::table('book_shelf')
            ->select('ebook.*', 'ebook__cover.*', 'book_shelf.*')
            ->leftjoin('ebook', 'ebook.file_id', 'book_shelf.file_id')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', 'ebook.file_id')
            ->orderby('book_shelf_id', 'ASC')
            ->get();



        return view('Cards.BookDetail',
            [
                'Categories'=>$Categories,
                'Categories_sub'=>$Categories_sub,
                'Categories_third'=>$Categories_third,

                'BookDetails' => $BookDetails,
                'Audios' => $Audios,
                'BookDetail' => $BookDetail,
                'promotion' => $promotion,
                'audios' => $audios,

                'bookshelf' => $bookshelf,
                'ArbicLearningBook' => $ArbicLearningBook,
            ]
        );
    }

    public function BookCategoryView(Request $request,$locale = "en",$p_slug,$s_slug = null,$t_slug = null)
    {

        App::setLocale($locale);
        session()->put('locale', $locale);

        $author = $request->input("author");
        $language = $request->input("language");

        $Categories = DB::table('category')->get();
        $Categories_sub = DB::table('category__sub')->get();
        $Categories_third = DB::table('category__third')->get();

        $BookDetail = DB::table('ebook')
            ->select('ebook.*', 'category__sub.*', 'ebook__cover.*', 'category.*')
            ->rightjoin('category', 'category.id', '=', 'ebook.category_id')
            ->rightjoin('category__sub', 'category__sub.id', '=', 'ebook.sub_cat_id')
            ->rightjoin('category__third', 'category__third.id', '=', 'ebook.third_cat_id')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where(function ($query) use ($t_slug, $p_slug, $s_slug,$author,$language) {
                // $query->where('category.category_slug', $p_slug);
                if ($s_slug != null) {
                    $query->where('category__sub.sub_category_slug', $s_slug);
                }
                if (!empty($t_slug)) {
                    $query->where('category__third.third_category_slug', $t_slug);
                }
                if (!empty($language)) {
                    $query->where('ebook.language_id', $language);
                }
                if (!empty($author)) {
                    $query->where('ebook.ebook_author', $author);
                }
            })
            ->orderBy('ebook.file_id', $request->input('orderBy') == "" ? 'DESC' : $request->input('orderBy'))
            ->paginate(20);
            return $BookDetail;
            $totalpage = $BookDetail->lastPage();


            if($request->ajax()){
                $view = view('Cards.CategoryItem',["BookDetail"=>$BookDetail,'Categories'=>$Categories,
                'Categories_sub'=>$Categories_sub,
                'Categories_third'=>$Categories_third,])->render();
                return response()->json(['html' => $view]);
            }

        $langGroup = DB::table('ebook')
            ->select('ebook.*','ebook.ebook_author as author', 'category__sub.*', 'ebook__cover.*')
            ->rightjoin('category', 'category.id', '=', 'ebook.category_id')
            ->rightjoin('category__sub', 'category__sub.id', '=', 'ebook.sub_cat_id')

            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where(function ($query) use ($p_slug,$s_slug,$author,$language) {
                $query->where('category.category_slug', $p_slug);
                if ($s_slug != null) {
                    $query->where('category__sub.sub_category_slug', $s_slug);
                }
                if (!empty($t_slug)) {
                    $query->where('category__third.third_category_slug', $t_slug);
                }
                if (!empty($author)) {
                    $query->where('ebook.ebook_author', $author);
                }
            })
            ->orderBy('ebook.file_id', $request->input('orderBy') == "" ? 'DESC' : $request->input('orderBy'))
            ->groupBy('ebook.language_id')
            ->get();

            $authorGroup = DB::table('ebook')
            ->select('ebook.*','ebook.ebook_author as author', 'category__sub.*', 'ebook__cover.*')
            ->rightjoin('category', 'category.id', '=', 'ebook.category_id')
            ->rightjoin('category__sub', 'category__sub.id', '=', 'ebook.sub_cat_id')
            ->leftjoin('ebook__cover', 'ebook__cover.file_id', '=', 'ebook.file_id')
            ->where(function ($query) use ($p_slug,$s_slug,$author,$language) {
                if ($s_slug != null) {
                    $query->where('category__sub.sub_category_slug', $s_slug);
                }
                $query->where('category.category_slug', $p_slug);
                if (!empty($t_slug)) {
                    $query->where('category__third.third_category_slug', $t_slug);
                }
                if (!empty($author)) {
                    $query->where('ebook.ebook_author', $author);
                }
            })
            ->groupBy('ebook_author')
            ->orderBy('ebook.file_id', $request->input('orderBy') == "" ? 'DESC' : $request->input('orderBy'))
            ->get();

     /*    if (count($BookDetail) == 0) {
            return view('Website.Error.404', [
            ]);
        } else { */
            return view('Cards.BookList', [
                'BookDetail' => $BookDetail,
                'authorGroup' => $authorGroup,
                'langGroup' => $langGroup,
                'test' => $language,
                'totalpage' => $totalpage,
                'author' => $author,
                'p_category_name' => $BookDetail,
                's_category_name' => $s_slug == null ? $BookDetail[0]->category_name : $BookDetail[0]->sub_cat_name,
                't_category' => $t_slug == null ? "yes" : "no",
                'orderBy' => $request->input('orderBy'),

                'Categories'=>$Categories,
                'Categories_sub'=>$Categories_sub,
                'Categories_third'=>$Categories_third,
            ]);

    }

    public function Contact() {
        $Categories = DB::table('category')->get();
        $Categories_sub = DB::table('category__sub')->get();
        $Categories_third = DB::table('category__third')->get();

        return view('Website.Contact.Contact',[
            'Categories'=>$Categories,
            'Categories_sub'=>$Categories_sub,
            'Categories_third'=>$Categories_third,
        ]);
    }

    public function BookRequestView()
    {
        $category = DB::table('category')->get();
        $sub_category = DB::table('category__sub')->get();

        $Categories = DB::table('category')->get();
        $Categories_sub = DB::table('category__sub')->get();
        $Categories_third = DB::table('category__third')->get();

        return view('Website.BookRequest.BookRequest',['categories' => $category,
        'sub_categories' => $sub_category,

        'Categories'=>$Categories,
        'Categories_sub'=>$Categories_sub,
        'Categories_third'=>$Categories_third,
    ]);
    }

    public function test()
    {
        return route('Login');
        $Categories = DB::table('category')->get();
        $Categories_sub = DB::table('category__sub')->get();
        $Categories_third = DB::table('category__third')->get();

        return view('testlayout', [

            'Categories'=>$Categories,
            'Categories_sub'=>$Categories_sub,
            'Categories_third'=>$Categories_third,
        ]);
    }
}
