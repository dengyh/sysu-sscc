# -*- coding: utf-8 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response

from django.contrib.auth.models import User
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.template import RequestContext

from team.models import Team, Member
from section.models import Section, Picture

@login_required
def getTeamInformation(request, templateName):
    try:
        member = Member.objects.get(user = request.user)
    except:
        return HttpResponseRedirect('/')
    return render_to_response(templateName, {
        'member' : member,
        }, context_instance = RequestContext(request))

def createTeam(request, templateName):
    message = ''
    if request.method == 'POST':
        teamName = request.POST.get('teamName', '')
        teamTeacher = request.POST.get('teamTeacher', '')
        if teamTeacher == '' or teamName == '':
            message = '队伍信息不完整'
        else:
            team = Team.objects.create(
                name = teamName,
                teacher = teamTeacher
                )
            message, teamFlag, leader = createLeader(request, team)

            if teamFlag:
                return HttpResponseRedirect('/team/')
            team.delete()
        return HttpResponse(message)

    sections = Section.objects.all()
    pictures = Picture.objects.all()
    return render_to_response(templateName, {
        'sections' : sections,
        'pictures' : pictures,
        'numbers' : range(1, 6),
        }, context_instance = RequestContext(request))

def checkItem(item):
    if item is None or item == '':
        return True
    return False

def createLeader(request, team):
    name = request.POST.get('leader-name', None)
    if checkItem(name):
        return ('队长姓名有误', False, None)
    sno = request.POST.get('leader-number', None)
    if checkItem(sno):
        return ('队长学号有误', False, None)
    collage = request.POST.get('leader-collage', None)
    if checkItem(collage):
        return ('队长学院有误', False, None)
    major = request.POST.get('leader-major', None)
    if checkItem(major):
        return ('队长专业有误', False, None)
    sclass = request.POST.get('leader-class', None)
    if checkItem(sclass):
        return ('队长班级有误', False, None)
    phone = request.POST.get('leader-phone', None)
    if checkItem(phone):
        return ('队长手机有误', False, None)
    cornet = request.POST.get('leader-cornet', None)
    if checkItem(cornet):
        return ('队长短号有误', False, None)
    email = request.POST.get('leader-email', None)
    if checkItem(email):
        return ('队长邮箱有误', False, None)
    qq = request.POST.get('leader-qq', None)
    if checkItem(qq):
        return ('队长QQ有误', False, None)
    dormitory = request.POST.get('leader-dormitory', None)
    if checkItem(dormitory):
        return ('队长宿舍有误', False, None)
    gender = request.POST.get('leader-gender', None)
    if checkItem(gender):
        return ('队长性别有误', False, None)
    password1 = request.POST.get('leader-password1', None)
    password2 = request.POST.get('leader-password2', None)
    if password2 != password1:
        return ('队长密码不匹配', False, None)
    user = User.objects.create(username = sno)
    user.set_password(password1)
    user.save()
    member = Member.objects.create(
        team = team,
        user = user,
        isLeader = True,
        name = name,
        email = email,
        phone = phone,
        cornet = cornet,
        qq = qq,
        dormitory = dormitory,
        sno = sno,
        collage = collage,
        major = major,
        sclass = sclass,
        gender = gender,
        )
    user = auth.authenticate(username = sno,
        password = password1)
    auth.login(request, user)
    return ('队长创建成功', True, member)

# memberFlag = True
# index = 1
# members = []
# while memberFlag:
#     message, memberFlag, member = createMember(request, team, index)
#     if member is not None:
#         members.append(member)
#     index += 1
# if index < 3:
#     for item in members:
#         item.user.delete()
#         item.delete()
#     leader.user.delete()
#     leader.delete()
#     team.delete()

def createMember(request, team, index):
    strIndex = str(index)
    name = request.POST.get('member-' + strIndex + '-name', None)
    if checkItem(name):
        return ('队员' + strIndex + '姓名有误', False, None)
    sno = request.POST.get('member-' + strIndex + '-number', None)
    if checkItem(sno):
        return ('队员' + strIndex + '学号有误', False, None)
    collage = request.POST.get('member-' + strIndex + '-collage', None)
    if checkItem(collage):
        return ('队员' + strIndex + '学院有误', False, None)
    major = request.POST.get('member-' + strIndex + '-major', None)
    if checkItem(major):
        return ('队员' + strIndex + '专业有误', False, None)
    sclass = request.POST.get('member-' + strIndex + '-class', None)
    if checkItem(sclass):
        return ('队员' + strIndex + '班级有误', False, None)
    phone = request.POST.get('member-' + strIndex + '-phone', None)
    if checkItem(phone):
        return ('队员' + strIndex + '手机有误', False, None)
    cornet = request.POST.get('member-' + strIndex + '-cornet', None)
    if checkItem(cornet):
        return ('队员' + strIndex + '短号有误', False, None)
    email = request.POST.get('member-' + strIndex + '-email', None)
    if checkItem(email):
        return ('队员' + strIndex + '邮箱有误', False, None)
    qq = request.POST.get('member-' + strIndex + '-qq', None)
    if checkItem(qq):
        return ('队员' + strIndex + 'QQ有误', False, None)
    dormitory = request.POST.get('member-' + strIndex + '-dormitory', None)
    if checkItem(dormitory):
        return ('队员' + strIndex + '宿舍有误', False, None)
    gender = request.POST.get('member-' + strIndex + '-gender', None)
    if checkItem(gender):
        return ('队员' + strIndex + '性别有误', False, None)
    user = User.objects.create(username = sno)
    user.set_password(sno)
    member = Member.objects.create(
        team = team,
        user = user,
        name = name,
        email = email,
        phone = phone,
        cornet = cornet,
        qq = qq,
        dormitory = dormitory,
        sno = sno,
        collage = collage,
        major = major,
        sclass = sclass,
        gender = gender,
        )
    return ('队员' + strIndex + '创建成功', True, member)
