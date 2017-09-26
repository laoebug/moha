<select id="menu_list" name="menu_list[]" multiple="multiple">

	<?php if(count($models)>0): ?>
		<?php foreach ($models as $menu): ?>
		<option value="one" data-section="top" selected="selected" data-index="3">
		<?php echo $menu["name"];?>
		</option>
		<?php endforeach;?>
	<?php endif;?>
	
</select>



<br/>

<select id="menu_list1" name="menu_list1[]" multiple="multiple">
  <option value="one" data-section="top" selected="selected" data-index="3">C++</option>
  <option value="two" data-section="top" selected="selected" data-index="1">Python</option>
  <option value="three" data-section="top" selected="selected" data-index="2">Ruby</option>
  <option value="four" data-section="top">Swift</option>
<!--   <option value="wow" data-section="JavaScript/Library/Popular">jQuery</option> -->
</select>




<link rel="stylesheet" href="js/multi_select_tree/jquery.tree-multiselect.min.css">
<script type="text/javascript" src="js/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/multi_select_tree/jquery.tree-multiselect.min.js"></script>

<script type="text/javascript">
$("#menu_list1").treeMultiselect({

	  // Sections have checkboxes which when checked, check everything within them
	  allowBatchSelection: true,

	  // Selected options can be sorted by dragging 
	  // Requires jQuery UI
	  sortable: false,

	  // Adds collapsibility to sections
	  collapsible: true,

	  // Enables selection of all or no options
	  enableSelectAll: false,

	  // Only used if enableSelectAll is active
	  selectAllText: 'Select All',

	  // Only used if enableSelectAll is active
	  unselectAllText: 'Unselect All',

	  // Disables selection/deselection of options; aka display-only
	  freeze: false,

	  // Hide the right panel showing all the selected items
	  hideSidePanel: true,

	  // Only sections can be checked, not individual items
	  onlyBatchSelection: false,

	  // Separator between sections in the select option data-section attribute
	  sectionDelimiter: '/',

	  // Show section name on the selected items
	  showSectionOnSelected: true,

	  // Activated only if collapsible is true; sections are collapsed initially
	  startCollapsed: false,

	  // Allows searching of options
	  searchable: true,

	  // Set items to be searched. Array must contain 'value', 'text', or 'description', and/or 'section'
	  searchParams: ['value', 'text', 'description', 'section'],

	  // Callback
	  onChange: null
	  
	});



</script>

<script>
$("#menu_list").treeMultiselect({

	  // Sections have checkboxes which when checked, check everything within them
	  allowBatchSelection: true,

	  // Selected options can be sorted by dragging 
	  // Requires jQuery UI
	  sortable: false,

	  // Adds collapsibility to sections
	  collapsible: true,

	  // Enables selection of all or no options
	  enableSelectAll: false,

	  // Only used if enableSelectAll is active
	  selectAllText: 'Select All',

	  // Only used if enableSelectAll is active
	  unselectAllText: 'Unselect All',

	  // Disables selection/deselection of options; aka display-only
	  freeze: false,

	  // Hide the right panel showing all the selected items
	  hideSidePanel: true,

	  // Only sections can be checked, not individual items
	  onlyBatchSelection: false,

	  // Separator between sections in the select option data-section attribute
	  sectionDelimiter: '/',

	  // Show section name on the selected items
	  showSectionOnSelected: true,

	  // Activated only if collapsible is true; sections are collapsed initially
	  startCollapsed: false,

	  // Allows searching of options
	  searchable: true,

	  // Set items to be searched. Array must contain 'value', 'text', or 'description', and/or 'section'
	  searchParams: ['value', 'text', 'description', 'section'],

	  // Callback
	  onChange: null
	  
	});



</script>


