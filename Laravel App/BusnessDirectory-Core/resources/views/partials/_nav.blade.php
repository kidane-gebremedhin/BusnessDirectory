  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar" style="background: //red">
      <!-- Sidebar user panel -->
<!--       <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Alexander Pierce</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div> -->
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree" style="background: //red">
        <li class="header">MAIN NAVIGATION</li>
        <li>
          <a class="get" href="{{route('home')}}">
            <i class="fa fa-dashboard"></i> <span>                            {{App\Global_var::getLangString('Dashboard', $language_strings)}}
            </span>
          </a>
        </li>

        @if($currentUser->isGranted('users.index'))
        <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i>
            <span>{{App\Global_var::getLangString('Users', $language_strings)}}</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li>
            <a class="get" href="{{route('users.newUsers')}}" ><i class="fa fa-circle-o"></i> {{App\Global_var::getLangString('New_Users', $language_strings)}}</a>
            </li>
            <li>
            <a class="get" href="{{route('users.index')}}" ><i class="fa fa-circle-o"></i> {{App\Global_var::getLangString('Users', $language_strings)}}</a>
            </li>
            </ul>
        </li>
        @endif
       @if($currentUser->isGranted('permissions.step1'))
        <li>
          <a class="get" href="{{route('permissions.step1')}}">
            <i class="fa fa-th"></i> <span>                            {{App\Global_var::getLangString('Permissions', $language_strings)}}
            </span>
          </a>
        </li>
        @endif

       @if($currentUser->isGranted('roles.index'))
        <li>
          <a class="get" href="{{route('roles.index')}}">
            <i class="fa fa-user"></i> <span>                            {{App\Global_var::getLangString('Roles', $language_strings)}}
            </span>
          </a>
        </li>
        @endif
       <!-- @if($currentUser->isGranted('departments.index'))
        <li>
          <a class="get" href="{{route('departments.index')}}">
            <i class="fa fa-pie-chart"></i> <span>                            {{App\Global_var::getLangString('Departments', $language_strings)}}
            </span>
          </a>
        </li>
        @endif -->
        @if($currentUser->isGranted('complex_buildings.index'))
        <li class="treeview">
          <a href="#">
            <i class="fa fa-folder"></i>
            <span>{{App\Global_var::getLangString('Data', $language_strings)}}</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a class="get" href="{{route('complex_buildings.index')}}" ><i class="fa fa-circle-o"></i> {{App\Global_var::getLangString('Buildings', $language_strings)}}</a></li>
            <li><a class="get" href="{{route('categories.index')}}" ><i class="fa fa-circle-o"></i> {{App\Global_var::getLangString('Categories', $language_strings)}}</a></li>
            <li><a class="get" href="{{route('letters.index')}}" ><i class="fa fa-circle-o"></i> {{App\Global_var::getLangString('Letters', $language_strings)}}</a></li>
            <li><a class="get" href="{{route('offices.index')}}" ><i class="fa fa-circle-o"></i> {{App\Global_var::getLangString('Offices', $language_strings)}}</a></li>
          </ul>
        </li>
        @endif
       @if($currentUser->isGranted('language_strings.edit'))
        <li>
          <a class="get" href="{{route('language_strings.edit')}}">
            <i class="fa fa-edit"></i> <span>                            {{App\Global_var::getLangString('Language_Strings', $language_strings)}}
            </span>
          </a>
        </li>
        @endif
        @if($currentUser->isGranted('logo.edit'))
        <li>
          <a class="get" href="{{route('logo.edit')}}">
            <i class="fa fa-laptop"></i> <span>                            {{App\Global_var::getLangString('User_Interface', $language_strings)}}
            </span>
          </a>
        </li>
        @endif
               @if($currentUser->isGranted('settings.index'))
        <li>
          <a class="get" href="{{route('settings.index')}}">
            <i class="fa fa-gear"></i> <span>                            {{App\Global_var::getLangString('Settings', $language_strings)}}
            </span>
          </a>
        </li>
        @endif
       @if($currentUser->isGranted('logs.index'))
        <li>
          <a class="get" href="{{route('logs.index')}}">
            <i class="fa fa-files-o"></i> <span>                            {{App\Global_var::getLangString('Logs', $language_strings)}}
            </span>
          </a>
        </li>
        @endif
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
