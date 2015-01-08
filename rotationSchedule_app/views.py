from django.shortcuts import get_object_or_404, render, render_to_response
from django.http import Http404, HttpResponse, HttpResponseRedirect
from django.template import RequestContext, loader
from rotationSchedule_app.forms import ResidentForm, YearForm, TrackForm, ProgramForm, RotationForm

from .models import Greeting
from rotationSchedule_app.models import Resident, Year, Track, Program, Rotation

# Create your views here.
def index(request):
    '''if request.method == 'POST':
        rForm = ResidentForm(request.POST)
        yForm = YearForm(request.POST)
        tForm = TrackForm(request.POST)
        pForm = ProgramForm(request.POST)
        rotationForm = RotationForm(request.POST)
        if 'resident' in request.POST:
            if rForm.is_valid():
                rForm.save()
                return HttpResponseRedirect('/')
        elif 'program' in request.POST:
            if pForm.is_valid():
                pForm.save()
                return HttpResponseRedirect('/')
        elif 'year' in request.POST:
            if yForm.is_valid():
                yForm.save()
                return HttpResponseRedirect('/')
        elif 'track' in request.POST:
            if tForm.is_valid():
                tForm.save()
                return HttpResponseRedirect('/')
        elif 'rotation' in request.POST:
            if rotationForm.is_valid():
                rotationForm.save()
                return HttpResponseRedirect('/')
        else:
            return HttpResponse('<h1>Form not valid</h1>')
    else:'''
    rForm = ResidentForm()
    yForm = YearForm()
    tForm = TrackForm()
    pForm = ProgramForm()
    rotationForm = RotationForm()
    context = {'rForm':rForm,'yForm':yForm,'tForm':tForm,'pForm':pForm,'rotationForm':rotationForm}
    return render_to_response('rotationSchedule_app/index.html', context, context_instance=RequestContext(request))

def db(request):
	greeting = Greeting()
	greeting.save()
	greetings = Greeting.objects.all()
	return render(request, 'db.html', {'greetings': greetings})


def detail(request, resident_id):
    resident_list = Resident.objects.order_by('-name')[:5]
    template = loader.get_template('rotationSchedule_app/index.html')
    context = RequestContext(request, {'resident_list': resident_list,})
    return HttpResponse(template.render(context))
    
    		#temp_post = rForm.save(commit=False)
    		#temp_post.save()
    		#newRes = Resident(name=rForm.cleaned_data['name'],year=rForm.cleaned_data['year'],track=rForm.cleaned_data['track'])
    		#newRes.save()    
    
def schedule(request):
    return render(request, 'schedule.html')
	#resident = get_object_or_404(Resident, pk=resident_id)

def resident(request):
    return render(request, 'resident.html')
#try:
    #    resident = Resident.objects.get(pk=resident_id)
    #except Resident.DoesNotExist:
    #    raise Http404
    #return render(request, 'rotationSchedule_app/detail.html', {'resident': resident,})



