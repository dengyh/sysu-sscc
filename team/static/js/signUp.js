(function() {
    $('#sign-frame').load(function() {
        var content = $(this).contents().find('body').html()
        $('#submitMessage').hide().html(content).fadeIn(1000);
    });
})();