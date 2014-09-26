# -*- coding: utf-8 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response

from django.contrib.auth.models import User
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.template import RequestContext

from team.models import Team, Member

@login_required
def getTeamInformation(request, templateName):
    try:
        member = Member.objects.get(user = request.user)
    except:
        return HttpResponseRedirect('/')
    return render_to_response(templateName, {
        'member' : member,
        }, context_instance = RequestContext(request))