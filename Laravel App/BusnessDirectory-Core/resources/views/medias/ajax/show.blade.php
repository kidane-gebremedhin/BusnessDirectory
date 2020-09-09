<div class="col-md-12" style="margin-top: -60px">
<div class="panel panel-success">
    <div class="panel-heading">
        
    </div>
    <div class="panel-body" style="height: 800px">
        @if($document_edition->isVideo_Audio())
<div class="col-md-10 col-md-offset-1">
    @if($document_edition->isVideo())
    <video id="video1"  width="1000" autoplay controls controlsList="nodownload">
        <source src="{{ route('stream_media', $document_edition->id) }}" type="video/mp4">
        Your browser does not support HTML5 video.
      </video>

    @elseif($document_edition->isAudio())
      <embed src="{{ route('stream_media', $document_edition->id) }}" width="1000" height="500" type="audio/mp3" />
    @endif
    <div class="col-md-12">
    <hr>
    @if($currentUser->isGranted_ID('documents.download', $document_edition->id))
    <a class="btn btn-success pull-right" href="{{ route('documents.download', $document_edition->id) }}"><i class="fa fa-download"></i>
      {{App\Global_var::getLangString('Download', $language_strings)}}
    </a>
    @endif
    <strong>{{$document_edition->document!=null? $document_edition->document->title:''}}
    </strong>
    </div>
</div>
@elseif($document_edition->isText_Image())
<div class="col-md-10 col-md-offset-1">
    <div class="col-md-12" style="z-index: 1000">
    <strong>{{$document_edition->document!=null? $document_edition->document->title:''}}
    </strong>
    @if($currentUser->isGranted_ID('documents.download', $document_edition->id))
    <a class="btn btn-success pull-right" href="{{ route('documents.download', $document_edition->id) }}"><i class="fa fa-download"></i>
      {{App\Global_var::getLangString('Download', $language_strings)}}
    </a>
    @endif
    </div>
    <div class="col-md-12" style="background: gray; height: 1px; margin-top: 10px"></div>
    <embed src="{{ route('stream_text_image', $document_edition->id) }}#toolbar=0&navpanes=0&scrollbar=0" width="100%" height="600px" />
</div>
@endif

    </div>
</div>

</div>
