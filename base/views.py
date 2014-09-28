# -*- coding: utf-8 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response

from django.contrib.auth.models import User
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.template import RequestContext

from section.models import Section, Picture
from team.models import Team, Member

def getIndexView(request, templateName):
    sections = Section.objects.all()
    pictures = Picture.objects.all()
    teams = Team.objects.filter(isActive = True)
    for item in teams:
        item.members = Member.objects.filter(team = item)
    return render_to_response(templateName, {
        'sections' : sections,
        'pictures' : pictures,
        'teams' : teams,
        }, context_instance = RequestContext(request))
