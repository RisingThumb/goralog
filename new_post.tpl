<div>
% notices_handler
<form class="new-post" method="POST" enctype="multipart/form-data"><fieldset>
    <legend>Submit a new blog post</legend>
    <label>Text: <textarea cols="94" rows=16" name="body">%($"post_arg_body%)</textarea></label><br />
    <label>Title: <input size="64" type="text" name="title" value="%($"post_arg_title%)" /></label><br />
    <label>Filename(exclude .filetype ending): <input size="64" type="text" name="filename" value="%($"post_arg_filename%)" /></label><br />
    <label>Description: <textarea cols="94" rows=4" name="description">%($"post_arg_description%)</textarea></label><br />
    <label>Date(YYYY/MM/DD): <input size="10" maxlength="10" type="text" name="date" value="%($"post_arg_date%)" /></label><br />
    <input type="submit" value="Post" />
</fieldset></form>
</div>
