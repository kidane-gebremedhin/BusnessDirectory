<?php

/*--BussnessDirectory---*/

//----Backend routes---
Route::post('/load_server_data', 'BackendController@load_server_data')->name('load_server_data');

Route::post('/create_complex_buildings', 'BackendController@create_complex_buildings')->name('create_complex_buildings');
Route::post('/create_categories', 'BackendController@create_categories')->name('create_categories');
Route::post('/create_letters', 'BackendController@create_letters')->name('create_letters');
Route::post('/create_offices', 'BackendController@create_offices')->name('create_offices');
Route::post('/add_office_image', 'BackendController@add_office_image')->name('add_office_image');
Route::post('/remote_login', 'BackendController@remote_login')->name('remote_login');
Route::get('/change_office_status/{id}', 'officeController@changeStatus')->name('offices.changeStatus');

//----end of backend routes---

//complex_buildings 
Route::get('/complex_buildings-create', 'complex_buildingController@create')->name('complex_buildings.create');
Route::get('/complex_buildings-show/{id}', 'complex_buildingController@show')->name('complex_buildings.show');
Route::get('/complex_buildings-edit/{id}', 'complex_buildingController@edit')->name('complex_buildings.edit');
Route::post('/complex_buildings-update/{id}', 'complex_buildingController@update')->name('complex_buildings.update');
Route::get('/complex_buildings-index', 'complex_buildingController@index')->name('complex_buildings.index');
Route::post('/complex_buildings-store', 'complex_buildingController@store')->name('complex_buildings.store');
Route::get('/complex_buildings-confirm_delete/{id}', 'complex_buildingController@delete')->name('complex_buildings.delete');
Route::get('/complex_buildings-destroy/{id}', 'complex_buildingController@destroy')->name('complex_buildings.destroy');
//categories 
Route::get('/categories-create', 'categoriesController@create')->name('categories.create');
Route::get('/categories-show/{id}', 'categoriesController@show')->name('categories.show');
Route::get('/categories-edit/{id}', 'categoriesController@edit')->name('categories.edit');
Route::post('/categories-update/{id}', 'categoriesController@update')->name('categories.update');
Route::get('/categories-index', 'categoriesController@index')->name('categories.index');
Route::post('/categories-store', 'categoriesController@store')->name('categories.store');
Route::get('/categories-confirm_delete/{id}', 'categoriesController@delete')->name('categories.delete');
Route::get('/categories-destroy/{id}', 'categoriesController@destroy')->name('categories.destroy');
//letters 
Route::get('/letters-create', 'letterController@create')->name('letters.create');
Route::get('/letters-show/{id}', 'letterController@show')->name('letters.show');
Route::get('/letters-edit/{id}', 'letterController@edit')->name('letters.edit');
Route::post('/letters-update/{id}', 'letterController@update')->name('letters.update');
Route::get('/letters-index', 'letterController@index')->name('letters.index');
Route::post('/letters-store', 'letterController@store')->name('letters.store');
Route::get('/letters-confirm_delete/{id}', 'letterController@delete')->name('letters.delete');
Route::get('/letters-destroy/{id}', 'letterController@destroy')->name('letters.destroy');

//offices 
Route::get('/offices-create', 'officeController@create')->name('offices.create');
Route::get('/offices-show/{id}', 'officeController@show')->name('offices.show');
Route::get('/offices-edit/{id}', 'officeController@edit')->name('offices.edit');
Route::post('/offices-update/{id}', 'officeController@update')->name('offices.update');
Route::get('/offices-index', 'officeController@index')->name('offices.index');
Route::post('/offices-store', 'officeController@store')->name('offices.store');
Route::get('/offices-confirm_delete/{id}', 'officeController@delete')->name('offices.delete');
Route::get('/offices-destroy/{id}', 'officeController@destroy')->name('offices.destroy');
Route::get('/office_images/{id}', 'officeController@office_images')->name('offices.office_images');
Route::post('/add_office_image/{officeId}', 'officeController@add_office_image')->name('offices.add_office_image');

/*---end */


Route::post('/sign_up', 'UserController@sign_up')->name('sign_up');
Route::get('language_interpreter/{keyWord?}', 'Language_stringController@language_interpreter')->name('language_interpreter');

//documents 
Route::get('/new_documents', 'documentController@newDocuments')->name('documents.newDocuments');
Route::get( '/documents-download/{editionId}', 'documentController@download')->name('documents.download');
Route::get('/documents-create', 'documentController@create')->name('documents.create');
Route::get('/documents-show/{id}', 'documentController@show')->name('documents.show');
Route::get('/documents-edit/{id}', 'documentController@edit')->name('documents.edit');
Route::post('/documents-update/{id}', 'documentController@update')->name('documents.update');
Route::get('/documents-index/{category?}', 'documentController@index')->name('documents.index');
Route::post('/documents-store', 'documentController@store')->name('documents.store');
Route::get('/documents-confirm_delete/{id}', 'documentController@delete')->name('documents.delete');
Route::get('/documents-destroy/{id}', 'documentController@destroy')->name('documents.destroy');

//medias 
Route::get('/medias-create', 'mediaController@create')->name('medias.create');
Route::get('/medias-show/{id}', 'mediaController@show')->name('medias.show');
Route::get('/medias-edit/{id}', 'mediaController@edit')->name('medias.edit');
Route::post('/medias-update/{id}', 'mediaController@update')->name('medias.update');
Route::get('/medias-index', 'mediaController@index')->name('medias.index');
Route::post('/medias-store', 'mediaController@store')->name('medias.store');
Route::get('/medias-confirm_delete/{id}', 'mediaController@delete')->name('medias.delete');
Route::get('/medias-destroy/{id}', 'mediaController@destroy')->name('medias.destroy');

Route::post('upload', 'mediaController@upload')->name('upload');
Route::get('stream_video', 'mediaController@streamVideo')->name('stream_video');
Route::get('stream_audio', 'mediaController@streamAudio')->name('stream_audio');

Route::get('stream_media/{editionId}', 'mediaController@streamMedia')->name('stream_media');
Route::get('stream_text_image/{editionId}', 'mediaController@streamText_Image')->name('stream_text_image');

/*  new routes*/

Route::middleware(['Front'])->group(function () {

Route::get('/medias-create', 'mediaController@create')->name('medias.create');


Route::get('/403', 'Controller@error_403')->name('403');
Route::get('/generateReportByDateInterval', 'HomeController@generateReportByDateInterval')->name('generateReportByDateInterval');

Route::get('backup', 'BackupController@backup')->name('backup');

/*---Excel Reports--------*/

Route::post('/importExcel', 'ExportExcelController@importExcel')->name('importExcel');
Route::get('/Reports-index', 'ExportExcelController@Reports_Index')->name('Reports_Index');

Route::get('/export_excel/', 'ExportExcelController@index')->name('export_excel');
Route::get('/export_excel/{type}', 'ExportExcelController@excel')->name('export_excel.excel');

/*---end of Reports ---*/

Route::get('/language_strings-create', 'Language_stringController@create')->name('language_strings.create');
Route::post('/language_strings-store', 'Language_stringController@store')->name('language_strings.store');
Route::get('/language_strings-edit', 'Language_stringController@edit')->name('language_strings.edit');
Route::post('/language_strings-update', 'Language_stringController@update')->name('language_strings.update');


Route::get('/changeLanguage/{lang}', 'Language_stringController@changeLanguage')->name('language_strings.changeLanguage');

//logs 
Route::get('/logs-clearLogs_confirmation', 'logsController@clearLogs_confirmation')->name('logs.clearLogs_confirmation');
Route::get('/logs-clearLogs', 'logsController@clearLogs')->name('logs.clearLogs');
Route::get('/logs-create', 'logsController@create')->name('logs.create');
Route::get('/logs-show/{id}', 'logsController@show')->name('logs.show');
Route::get('/logs-edit/{id}', 'logsController@edit')->name('logs.edit');
Route::post('/logs-update/{id}', 'logsController@update')->name('logs.update');
Route::get('/logs-index', 'logsController@index')->name('logs.index');
Route::post('/logs-store', 'logsController@store')->name('logs.store');
Route::get('/logs-confirm_delete/{id}', 'logsController@delete')->name('logs.delete');
Route::get('/logs-destroy/{id}', 'logsController@destroy')->name('logs.destroy');

//departments 
Route::get('/departments-create', 'departmentController@create')->name('departments.create');
Route::get('/departments-show/{id}', 'departmentController@show')->name('departments.show');
Route::get('/departments-edit/{id}', 'departmentController@edit')->name('departments.edit');
Route::post('/departments-update/{id}', 'departmentController@update')->name('departments.update');
Route::get('/departments-index', 'departmentController@index')->name('departments.index');
Route::post('/departments-store', 'departmentController@store')->name('departments.store');
Route::get('/departments-confirm_delete/{id}', 'departmentController@delete')->name('departments.delete');
Route::get('/departments-destroy/{id}', 'departmentController@destroy')->name('departments.destroy');

//roles 
Route::get('/roles-create', 'roleController@create')->name('roles.create');
Route::get('/roles-show/{id}', 'roleController@show')->name('roles.show');
Route::get('/roles-edit/{id}', 'roleController@edit')->name('roles.edit');
Route::post('/roles-update/{id}', 'roleController@update')->name('roles.update');
Route::get('/roles-index', 'roleController@index')->name('roles.index');
Route::post('/roles-store', 'roleController@store')->name('roles.store');
Route::get('/roles-confirm_delete/{id}', 'roleController@delete')->name('roles.delete');
Route::get('/roles-destroy/{id}', 'roleController@destroy')->name('roles.destroy');

Auth::routes();

Route::get('/', 'HomeController@showWelcomePage')->name('welcome');
Route::get('/setSystemElementsIfNotExisted', 'Auth\LoginController@setSystemElementsIfNotExisted');
Route::post('/user/logout', 'Auth\LoginController@logout')->name('user.logout');

/*blog Route*/
Route::get('/blogs-index', 'blogController@index')->name('blogs.index');
Route::get('/blogs-create', 'blogController@create')->name('blogs.create');
Route::get('/blogs-edit/{id}', 'blogController@edit')->name('blogs.edit');
Route::get('/blogs-show/{id}', 'blogController@show')->name('blogs.show');
Route::post('/blogs-store', 'blogController@store')->name('blogs.store');
Route::post('/blogs-update/{id}', 'blogController@update')->name('blogs.update');
Route::get('/blogs-confirm_delete/{id}', 'blogController@delete')->name('blogs.delete');
Route::get('/blogs-destroy/{id}', 'blogController@destroy')->name('blogs.destroy');

/*Route::get('/externalBlogsIndex', 'ShopController@externalBlogsIndex')->name('blogs.externalBlogsIndex');
Route::get('/externalBlogPage/{blogId}', 'ShopController@externalBlogPage')->name('blogs.externalBlogPage');
Route::get('/searchByKey/{key}', 'ShopController@searchByKey')->name('shop.searchByKey');


//About Route
Route::get('/abouts_externalAboutPage', 'ShopController@externalAboutPage')->name('abouts.externalAboutPage');
*/
Route::get('/abouts-index', 'aboutController@index')->name('abouts.index');
Route::get('/abouts-create', 'aboutController@create')->name('abouts.create');
Route::get('/abouts-edit/{id}', 'aboutController@edit')->name('abouts.edit');
Route::get('/abouts-show/{id}', 'aboutController@show')->name('abouts.show');
Route::post('/abouts-store', 'aboutController@store')->name('abouts.store');
Route::post('/abouts-update/{id}', 'aboutController@update')->name('abouts.update');
Route::get('/abouts-confirm_delete/{id}', 'aboutController@delete')->name('abouts.delete');
Route::get('/abouts-destroy/{id}', 'aboutController@destroy')->name('abouts.destroy');

/*----------OLD ROUTES-----------------------*/

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/resources/manage-more', 'HomeController@manageMore')->name('resources.manageMore');
Route::get('/resources/manageMore_3rdLevel', 'HomeController@manageMore_3rdLevel')->name('resources.manageMore_3rdLevel');

/*------------------USERS----------------------------------------------*/
Route::get('/new_users', 'UserController@newUsers')->name('users.newUsers');
Route::get('/users-index', 'UserController@index')->name('users.index');
Route::get('/users-create', 'UserController@create')->name('users.create');
Route::get('/users-edit/{id}', 'UserController@edit')->name('users.edit');
Route::get('/users-show/{id}', 'UserController@show')->name('users.show');
Route::post('/users-store', 'UserController@store')->name('users.store');
Route::post('/users-update/{id}', 'UserController@update')->name('users.update');
Route::get('/users-confirm_delete/{id}', 'UserController@delete')->name('users.delete');
Route::get('/users-destroy/{id}', 'UserController@destroy')->name('users.destroy');


Route::get('/users_getUser/{id}', 'UserController@getUser')->name('users.getUser');

Route::get('/approvals_intro', 'HomeController@approvals_intro')->name('approvals_intro');
Route::get('/approve_new_user/{id}/{approvalStatus}', 'UserController@approveNewUser')->name('users.approveNewUser');
Route::get('/approve_new_document/{id}/{approvalStatus}', 'documentController@approveNewDocument')->name('documents.approveNewDocument');
Route::get('/change_user_status/{id}', 'UserController@changeStatus')->name('users.changeStatus');
Route::post('/users-manageAccounts', 'UserController@manageAccounts')->name('users.manageAccounts');
Route::get('/users-manageAccounts', 'UserController@manageAccountsPage')->name('users.manageAccounts');
Route::get('/users-import', 'UserController@usersImport')->name('users.import');
Route::post('/users-import-post', 'UserController@usersImportPost')->name('users.import.post');


/*------------------permissionS----------------*/
Route::get('/permissions_save/step1', 'permissionController@step1')->name('permissions.step1');
Route::get('/permissions_save/step2/{id}', 'permissionController@step2')->name('permissions.step2');
Route::get('/permissions_save/{actionType}', 'permissionController@savePermission')->name('permissions.save');
Route::get('/permissions_save/checkAll/{actionType}', 'permissionController@checkAllPermissions')->name('permissions.checkAll');
/*--document permissions--*/
Route::get('/document_role_permissions/{id}', 'permissionController@document_role_permissions')->name('permissions.document_role_permissions');
Route::get('/document_permissions_save/{actionType}', 'permissionController@saveDocumentPermission')->name('document_permissions_save.save');
Route::get('/document_permissions_save/checkAll/{actionType}', 'permissionController@checkAllDocumentPermissions')->name('document_permissions_save.checkAll');
/*--end of document permissions*/

/*---POPULATES SIDEBAR ----*/
Route::get('/list-permitted-resources', 'permissionController@listPermittedResources')->name('list.permitted.resources');

/*-------------------LOGO and IMAGE-------------*/
Route::post('/logo-update', 'logoController@update')->name('logo.update');
Route::get('/logo-edit', 'logoController@edit')->name('logo.edit');

Route::get('/getLiveCount', 'HomeController@getLiveCount');
/*-------------------END OF COUNTERS-------------*/

Route::get('/settings-index', 'SettingController@index')->name('settings.index');
Route::post('/settings-update/{id}', 'SettingController@update')->name('settings.update');

//countries 
Route::get('/countries-create', 'countriesController@create')->name('countries.create');
Route::get('/countries-show/{id}', 'countriesController@show')->name('countries.show');
Route::get('/countries-edit/{id}', 'countriesController@edit')->name('countries.edit');
Route::post('/countries-update/{id}', 'countriesController@update')->name('countries.update');
Route::get('/countries-index', 'countriesController@index')->name('countries.index');
Route::post('/countries-store', 'countriesController@store')->name('countries.store');
Route::get('/countries-confirm_delete/{id}', 'countriesController@delete')->name('countries.delete');
Route::get('/countries-destroy/{id}', 'countriesController@destroy')->name('countries.destroy');

//regions 
Route::get('/regions-create', 'regionController@create')->name('regions.create');
Route::get('/regions-show/{id}', 'regionController@show')->name('regions.show');
Route::get('/regions-edit/{id}', 'regionController@edit')->name('regions.edit');
Route::post('/regions-update/{id}', 'regionController@update')->name('regions.update');
Route::get('/regions-index', 'regionController@index')->name('regions.index');
Route::post('/regions-store', 'regionController@store')->name('regions.store');
Route::get('/regions-confirm_delete/{id}', 'regionController@delete')->name('regions.delete');
Route::get('/regions-destroy/{id}', 'regionController@destroy')->name('regions.destroy');

//zones 
Route::get('/zones-create', 'zoneController@create')->name('zones.create');
Route::get('/zones-show/{id}', 'zoneController@show')->name('zones.show');
Route::get('/zones-edit/{id}', 'zoneController@edit')->name('zones.edit');
Route::post('/zones-update/{id}', 'zoneController@update')->name('zones.update');
Route::get('/zones-index', 'zoneController@index')->name('zones.index');
Route::post('/zones-store', 'zoneController@store')->name('zones.store');
Route::get('/zones-confirm_delete/{id}', 'zoneController@delete')->name('zones.delete');
Route::get('/zones-destroy/{id}', 'zoneController@destroy')->name('zones.destroy');

//weredas 
Route::get('/weredas-create', 'weredaController@create')->name('weredas.create');
Route::get('/weredas-show/{id}', 'weredaController@show')->name('weredas.show');
Route::get('/weredas-edit/{id}', 'weredaController@edit')->name('weredas.edit');
Route::post('/weredas-update/{id}', 'weredaController@update')->name('weredas.update');
Route::get('/weredas-index', 'weredaController@index')->name('weredas.index');
Route::post('/weredas-store', 'weredaController@store')->name('weredas.store');
Route::get('/weredas-confirm_delete/{id}', 'weredaController@delete')->name('weredas.delete');
Route::get('/weredas-destroy/{id}', 'weredaController@destroy')->name('weredas.destroy');

// Tabyas
Route::get('/tabyas-create', 'tabyaController@create')->name('tabyas.create');
Route::get('/tabyas-show/{id}', 'tabyaController@show')->name('tabyas.show');
Route::get('/tabyas-edit/{id}', 'tabyaController@edit')->name('tabyas.edit');
Route::post('/tabyas-update/{id}', 'tabyaController@update')->name('tabyas.update');
Route::get('/tabyas-index', 'tabyaController@index')->name('tabyas.index');
Route::post('/tabyas-store', 'tabyaController@store')->name('tabyas.store');
Route::get('/tabyas-confirm_delete/{id}', 'tabyaController@delete')->name('tabyas.delete');
Route::get('/tabyas-destroy/{id}', 'tabyaController@destroy')->name('tabyas.destroy');

// Kebelles
Route::get('/kebelles-create', 'KebelleController@create')->name('kebelles.create');
Route::get('/kebelles-show/{id}', 'KebelleController@show')->name('kebelles.show');
Route::get('/kebelles-edit/{id}', 'KebelleController@edit')->name('kebelles.edit');
Route::post('/kebelles-update/{id}', 'KebelleController@update')->name('kebelles.update');
Route::get('/kebelles-index', 'KebelleController@index')->name('kebelles.index');
Route::post('/kebelles-store', 'KebelleController@store')->name('kebelles.store');
Route::get('/kebelles-confirm_delete/{id}', 'KebelleController@delete')->name('kebelles.delete');
Route::get('/kebelles-destroy/{id}', 'KebelleController@destroy')->name('kebelles.destroy');
// filter
Route::get("/tabya_kebelles/{tabyaId}", "KebelleController@tabya_kebelles")->name("tabya_kebelles");
Route::get("/wereda_tabyas/{weredaId}", "KebelleController@wereda_tabyas")->name("wereda_tabyas");
Route::get("/wereda_subWeredas/{weredaId}", "KebelleController@wereda_subWeredas")->name("wereda_subWeredas");

Route::get("/region_zones/{regionId}", "KebelleController@region_zones")->name("region_zones");
Route::get("/zone_weredas/{zoneId}", "KebelleController@zone_weredas")->name("zone_weredas");
// UnAssigned user filter 
Route::get("/unAssigned_zone_weredas/{zoneId}", "KebelleController@unAssigned_zone_weredas")->name("unAssigned_zone_weredas");
Route::get("/unAssigned_wereda_tabyas/{weredaId}", "KebelleController@unAssigned_wereda_tabyas")->name("unAssigned_wereda_tabyas");
Route::get("/unAssigned_tabya_kebelles/{tabyaId}", "KebelleController@unAssigned_tabya_kebelles")->name("unAssigned_tabya_kebelles");


});