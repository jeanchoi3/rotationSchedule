from django.shortcuts import get_object_or_404, render, render_to_response
from django.http import Http404, HttpResponse
from django.template import RequestContext, loader
from rotationSchedule_app.forms import ResidentForm

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
    
    if request.method == 'POST':
    	rForm = ResidentForm(request.POST)
    	if rForm.is_valid():
    		#temp_post = rForm.save(commit=False)
    		#temp_post.save()
    		newRes = Resident(name=rForm.cleaned_data['name'],year=rForm.cleaned_data['year'],track=rForm.cleaned_data['track'])
            newRes.save()
    		return HttpResponseRedirect('/')
    else:
    	rForm = ResidentForm()
    	
    context = {'rForm':rForm}
    return render_to_response('rotationSchedule_app/detail.html', context, context_instance=RequestContext(request))
    
#used to be def detail(request, resident_id):
	#resident = get_object_or_404(Resident, pk=resident_id)

#try:
    #    resident = Resident.objects.get(pk=resident_id)
    #except Resident.DoesNotExist:
    #    raise Http404
    #return render(request, 'rotationSchedule_app/detail.html', {'resident': resident,})



