# -*- coding: utf-8 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response

from django.contrib.auth.models import User
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.template import RequestContext

from section.models import Section, Picture

def loginView(request, templateName):
    # if request.user.is_authenticated():
    #     return HttpResponseRedirect('/team/')

    login_message = ''

    if request.method == 'POST':
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')
        try:
            user = User.objects.get(username = username)
            user = auth.authenticate(username = username, password = password)
            if user is None:
                login_message = '密码错误'
            elif user.is_active is False:
                login_message = '用户无效'
            else:
                auth.login(request, user)
                login_message = '登录成功'
                return HttpResponseRedirect('/team/')
        except:
            login_message = '账户还未报名'

    sections = Section.objects.all()
    pictures = Picture.objects.all()

    return render_to_response(templateName, {
        'login_message' : login_message,
        'sections' : sections,
        'pictures' : pictures,
        }, context_instance = RequestContext(request))

def logoutView(request):
    auth.logout(request)
    return HttpResponseRedirect('/')
