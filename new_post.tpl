<div>
% notices_handler
<form class="new-post" method="POST" enctype="multipart/form-data"><fieldset>
    <legend>Submit a new blog post</legend>
    <label>Title: <input size="64" type="text" name="title" value="%($"post_arg_title%)" required/></label><br />
    <label>Filename(exclude .filetype ending): <input size="64" type="text" name="filename" value="%($"post_arg_filename%)" required/></label><br />
    <label>Text: <textarea class="text-area-big" name="body" required>%(`{cat /tmp/$"post_arg_body | dos2unix}%)</textarea></label><br />
    <label>Description: <textarea name="description" required>%($"post_arg_description%)</textarea></label><br />
    <label>Date(YYYY-MM-DD): <input size="10" maxlength="10" type="date" name="date" value="%($"post_arg_date%)" required/></label><br />
    <input type="submit" value="Post" />
</fieldset></form>
</div>
