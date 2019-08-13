<?php

        function is_decendant($pageid,$item)
        {
	  // The following commented part is if submenus 
	  // should close when other part sof the site are looked at.
//           if ($item[0] == $pageid)
// 	    return True;

// 	  if (count($item) > 2 && count($item[2]) > 0)
// 	  {
// 	    foreach ($item[2] as $subitem)
// 	    {
// 	      if (is_decendant($pageid,$subitem))
// 	        return True;
// 	    }	      
// 	  }
//
//	  return False;

	  return True;
        }

	function make_menuitem($item,$pageid)
        {
	      echo "<li>";
	      if ($item[0] == $pageid)
	      {
	         echo "> ".$item[1];
	      }
	      else
	      {
	         echo "<a href=\"lpnpage.php?pageid=".$item[0]."\">".$item[1]."</a>";
	      } 

	      if (is_decendant($pageid,$item) && count($item) > 2 && count($item[2]) > 0)
	      {
	         echo "<ul>";
	         foreach ($item[2] as $subitem_index => $subitem)
                 { 
		   make_menuitem($subitem,$pageid);
	           //echo "<li><a href=\"lpnpage.php?pageid=".$subitem[0]."\">".$subitem[1]."</a></li>";
	         }
	         echo "</ul>";
	      }

	      echo "</li>";          
        }


	function make_navmenu($pageid)
	{


	// Here is where the structure of the site is defined.
	// Menu antries are: pageid (which is also the name of the file 
	// containing the content), button text, submenu
	$menu = array();
	$menu[] = array("top","LPN! Home",array());
	$menu[] = array("online","Free Online Version",array());
	$menu[] = array("handheld","Paperback English",array());
	$menu[] = array("french","Paperback Fran&ccedil;ais",array());
//	                        array(array("handheld","English"),
//	                            array("french","Fran&ccedil;ais")));
	$menu[] = array("teaching","Teaching Prolog",array());
	$menu[] = array("implementations","Prolog Implementations",array());
	$menu[] = array("manuals","Prolog Manuals",array());
	$menu[] = array("links","Prolog Links",array());
	$menu[] = array("thanks","Thanks!",array());
	$menu[] = array("contact","Contact us",array());

	echo "<ul>";

	   foreach ($menu as $item)
	   {
		make_menuitem($item,$pageid);
	   } 

	echo "</ul>";

	}

?>