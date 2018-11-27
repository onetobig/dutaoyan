function tinymce_init_callback(editor) {
    editor.on('change', function (e) {
        editor.save();
    });
}
