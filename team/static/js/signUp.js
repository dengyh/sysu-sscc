(function() {
    $('#sign-frame').load(function() {
        var content = $(this).contents().find('body').html();
        if (content == 'true') {
            location.href = '/team/';
        }
        $('#submitMessage').hide().html(content).fadeIn(1000);
    });
})();