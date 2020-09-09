@extends("layouts.master")
@section("title", "delete")

@section("bodyContent") 
@include('offices.ajax.delete-confirm')
@stop