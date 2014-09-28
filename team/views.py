# -*- coding: utf-8 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response

from django.contrib.auth.models import User
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.template import RequestContext, Template, Context
from django.template.loader import get_template

from team.models import Team, Member
from section.models import Section, Picture

import json
import datetime

@login_required
def getTeamInformation(request, templateName):
    selfs = Member.objects.filter(user = request.user)
    if len(selfs) == 0:
        return HttpResponseRedirect('/')
    for item in selfs:
        item.members = Member.objects.filter(team = item.team)
    return render_to_response(templateName, {
        'selfs' : selfs,
        }, context_instance = RequestContext(request))

def createTeam(request, templateName):
    message = ''
    if request.method == 'POST':
        if datetime.datetime.now() < datetime.datetime(2014, 9, 29, 0, 0):
            message = '还未到报名时间'
        else:
            teamName = request.POST.get('teamName', '')
            teamTeacher = request.POST.get('teamTeacher', '')
            if teamTeacher == '' or teamName == '':
                message = '队伍信息不完整'
            else:
                tempTeam = Team.objects.filter(name = teamName)
                if len(tempTeam) > 0:
                    message = '队伍名已被使用'
                else:
                    team = Team.objects.create(
                        name = teamName,
                        teacher = teamTeacher
                        )
                    message, teamFlag, leader = createLeader(request, team)

                    if teamFlag:
                        return HttpResponse('true')
                    team.delete()
        return HttpResponse(message)

    timeFlag = False
    if datetime.datetime.now() < datetime.datetime(2014, 9, 29, 0, 0):
        timeFlag = True
    sections = Section.objects.all()
    pictures = Picture.objects.all()
    return render_to_response(templateName, {
        'sections' : sections,
        'pictures' : pictures,
        'timeFlag' : timeFlag,
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
    tempMember = Member.objects.filter(sno = sno)
    if len(tempMember) > 0:
        if tempMember[0].isLeader:
            return ('你已经是一个另一个队伍的队长', False, None)
    password1 = request.POST.get('leader-password1', None)
    password2 = request.POST.get('leader-password2', None)
    if password2 != password1:
        return ('队长密码不匹配', False, None)
    try:
        user = User.objects.get(username = sno)
    except:
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
    auth.logout(request)
    user = auth.authenticate(username = sno,
        password = password1)
    auth.login(request, user)
    return ('队长创建成功', True, member)

@csrf_exempt
def createMember(request, templateName):
    message = ''
    success = False
    html = ''
    team = Member.objects.get(user = request.user, isLeader = True).team
    if request.method == 'POST':
        name = request.POST.get('name', None)
        sno = request.POST.get('number', None)
        collage = request.POST.get('collage', None)
        major = request.POST.get('major', None)
        sclass = request.POST.get('sclass', None)
        phone = request.POST.get('phone', None)
        cornet = request.POST.get('cornet', None)
        email = request.POST.get('email', None)
        qq = request.POST.get('qq', None)
        dormitory = request.POST.get('dormitory', None)
        gender = request.POST.get('gender', None)
        members = Member.objects.filter(sno = sno)
        teamers = Member.objects.filter(team = team)
        if len(teamers) > 6:
            message = '该队伍已经超过六个人'
            return HttpResponse(json.dumps({
                'success' : success,
                'message' : message,
                }))
        if len(teamers) > 1:
            team.isActive = True
            team.status = '队伍人数符合'
            team.save()
        if len(members) > 1:
            message = '该学生已经参与两支队伍'
            return HttpResponse(json.dumps({
                'success' : success,
                'message' : message,
                }))
        if len(members) == 1:
            user = members[0].user
        else:
            user = User.objects.create(username = sno)
            user.set_password(sno)
            user.save()
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
        success = True
        message = team.status
        memberTemplate = get_template(templateName)
        html = memberTemplate.render(Context({
            'member' : member
            }))
    return HttpResponse(json.dumps({
        'success' : success,
        'message' : message,
        'html' : html,
        'team' : team.id
        }))

@csrf_exempt
def deleteMember(request):
    message = ''
    success = False
    team = None
    if request.method == 'POST':
        memberID = request.POST.get('memberID', None)
        if memberID:
            member = Member.objects.get(id = memberID)
            user = member.user
            team = member.team
            member.delete()
            members = Member.objects.filter(user = user)
            if len(members) == 0:
                user.delete()
            teamers = Member.objects.filter(team = team)
            if len(teamers) < 3:
                team.isActive = False
                team.status = '参赛人数不足'
                team.save()
            success = True
            message = '删除成功'
    return HttpResponse(json.dumps({
        'success' : success,
        'message' : message,
        'team' : team.id,
        'status' : team.status,
        }))