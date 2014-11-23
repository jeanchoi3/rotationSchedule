from django.shortcuts import get_object_or_404, render
from django.http import Http404, HttpResponse
from django.template import RequestContext, loader

from .models import Greeting
from rotationSchedule_app.models import Resident

# Create your views here.
def index(request):
    resident_list = Resident.objects.order_by('-name')[:5]
    template = loader.get_template('rotationSchedule_app/index.html')
    context = RequestContext(request, {'resident_list': resident_list,})
    return HttpResponse(template.render(context))


def db(request):

    greeting = Greeting()
    greeting.save()

    greetings = Greeting.objects.all()

    return render(request, 'db.html', {'greetings': greetings})


def detail(request, resident_id):
    resident = get_object_or_404(Resident, pk=resident_id)
    return render(request, 'rotationSchedule_app/detail.html', {'resident':resident,})

#try:
    #    resident = Resident.objects.get(pk=resident_id)
    #except Resident.DoesNotExist:
    #    raise Http404
    #return render(request, 'rotationSchedule_app/detail.html', {'resident': resident,})



