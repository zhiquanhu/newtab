
$('#purge-storage').click ->
  localStorage.clear()
  return false


$('#settings-toggle').click ->
  $('.settings').toggle()
  return false


Settings.initialize
  key: 'f0nb7har6a4aar0'
  ->
    chrome.bookmarks.getTree (tree) ->
      mytree = null
      $.each tree[0].children[1].children, (i,subtree) ->
        mytree = subtree if subtree.title == 'newtab'

      $.each mytree.children, (i,subtree) ->
        row = $('<ul>')
        $('body').append row

        $.each subtree.children, (i,bookmark) ->
          butt = new Button bookmark
          row.append butt.li
