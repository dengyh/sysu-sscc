# -*- coding: utf-8 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response

from django.contrib.auth.models import User
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.template import RequestContext

from section.models import Section, Picture

def getIndexView(request, templateName):
    sections = Section.objects.all()
    pictures = Picture.objects.all()
    return render_to_response(templateName, {
        'sections' : sections,
        'pictures' : pictures,
        }, context_instance = RequestContext(request))
