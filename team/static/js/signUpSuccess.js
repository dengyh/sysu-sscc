(function() {
    $('#create-form').submit(function() {
        var name = $(this).find('[name="member-name"]').val();
        var number = $(this).find('[name="member-number"]').val();
        var collage = $(this).find('[name="member-collage"]').val();
        var major = $(this).find('[name="member-major"]').val();
        var sclass = $(this).find('[name="member-class"]').val();
        var phone = $(this).find('[name="member-phone"]').val();
        var cornet = $(this).find('[name="member-cornet"]').val();
        var email = $(this).find('[name="member-email"]').val();
        var qq = $(this).find('[name="member-qq"]').val();
        var dormitory = $(this).find('[name="member-dormitory"]').val();
        var gender = $(this).find('option:selected').val();
        if (check(name, '姓名')) return false;
        if (check(number, '学号')) return false;
        if (check(collage, '学院')) return false;
        if (check(major, '专业')) return false;
        if (check(sclass, '班级')) return false;
        if (check(phone, '手机')) return false;
        if (check(email, '邮箱')) return false;
        if (check(qq, 'QQ')) return false;
        if (check(dormitory, '宿舍')) return false;
        $('.form-message').fadeOut(200, function() {
            $(this).html('&nbsp').fadeIn(1000);
        });
        $.post('/create/', {
            name : name,
            number : number,
            collage : collage,
            major : major,
            sclass : sclass,
            phone : phone,
            cornet : cornet,
            email : email,
            qq : qq,
            dormitory : dormitory,
            gender : gender,
        }, function(data) {
            if (data['success']) {
                $('#member-list').append(data['html']);
                $('#team' + data['team']).text(data['message']);
                $('.delete-member').click(function() {
                    var memberID = $(this).attr('data-id');
                    var dom = $(this);
                    $.post('/delete/', {
                        'memberID' : memberID,
                    }, function(data) {
                        if (data['success']) {
                            alert(data['message']);
                            $('#member' + memberID).slideUp(1000);
                            $('#team' + data['team']).text(data['status']);
                        } else {
                            alert(data['message']);
                        }
                    }, 'json');
                });
            } else {
                $('.form-message').fadeOut(200, function() {
                $(this).html(data['message']).fadeIn(1000);
            });
            }
        }, 'json');
        $(this).find('input').val('');
        return false;
    });

    function check(value, item) {
        if (value == '') {
            $('.form-message').fadeOut(200, function() {
                $(this).html(item + '不能为空').fadeIn(1000);
            });
            return true;
        }
        return false;
    }

    $('.delete-member').click(function() {
        var memberID = $(this).attr('data-id');
        var dom = $(this);
        $.post('/delete/', {
            'memberID' : memberID,
        }, function(data) {
            if (data['success']) {
                alert(data['message']);
                $('#member' + memberID).slideUp(1000);
                $('#team' + data['team']).text(data['status']);
            } else {
                alert(data['message']);
            }
        }, 'json');
    });
})();