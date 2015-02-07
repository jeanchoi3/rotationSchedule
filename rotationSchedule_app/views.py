from django.shortcuts import get_object_or_404, render, render_to_response
from django.http import Http404, HttpResponse, HttpResponseRedirect
from django.template import RequestContext, loader
from rotationSchedule_app.forms import ResidentForm, YearForm, TrackForm, ProgramForm, RotationForm, BlockForm
import json
from django.core.management import call_command
from django.forms.models import modelformset_factory

from rotationSchedule_app.models import Resident, Year, Track, Program, Rotation, Block

# Create your views here.
def index(request):
    RotationFormSet = modelformset_factory(Rotation, form=RotationForm, extra=2)
    if request.method == 'POST':
        rotation_formset = RotationFormSet(request.POST, prefix='rotations')
        pForm = ProgramForm(request.POST)
        rotationForm = RotationForm(request.POST)
        bForm = BlockForm(request.POST)
        if 'multiple' in request.POST:
            if pForm.is_valid() and rotationForm.is_valid() and bForm.is_valid() and rotation_formset.is_valid():
                pForm.save()
                rotationForm.save()
                bForm.save()
                #rotation_formset.save()
                #rotation_instances = rotation_formset.save(commit=False)
                rotation_instances = rotation_formset.save(commit=False)
                print rotation_formset.deleted_objects
                for instance in rotation_instances:
                	if instance not in rotation_formset.deleted_objects:
                		instance.save()
                '''for instance in rotation_formset.deleted_objects:
                	instance.delete()
                for instance in rotation_formset.changed_objects:
                	instance.save()
                for instance in rotation_formset.new_objects:
                	instance.save()'''
                return HttpResponseRedirect('/')
        else:
            return HttpResponse('<h1>Form not valid</h1>')
    else:
        pForm = ProgramForm()
        rotationForm = RotationForm()
        bForm = BlockForm()
        rotation_formset = RotationFormSet(prefix='rotations')
    context = {'pForm':pForm,'rotationForm':rotationForm,'bForm':bForm,'rotation_formset':rotation_formset}
    return render_to_response('rotationSchedule_app/index.html', context, context_instance=RequestContext(request))


def create_post(request):
    if request.method == 'POST':
        '''form = ProgramForm(request.POST)
        if form.is_valid():
            form.save()
            pass
        return render(request, 'index.html',{'pForm':form})'''
        program_name = request.POST.get('the_program')
        response_data = {}

        program = Program(name=program_name)
        program.save()

        response_data['result'] = 'Create program successful!'
        #response_data['programpk'] = program.pk
        
        return HttpResponse(
            json.dumps(response_data),
            content_type="application/json"
        )
    else:
        return HttpResponse(
            json.dumps({"nothing to see": "this isn't happening"}),
            content_type="application/json"
        )

def db(request):
	#greeting = Greeting()
	#greeting.save()
	#greetings = Greeting.objects.all()
	return render(request, 'db.html')


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
    #call_command('x')
    #programs = call_command('x')
    #context = {'programs':programs,}
    #return render_to_response('rotationSchedule_app/schedule.html', context, context_instance=RequestContext(request))

    return render(request, 'schedule.html')
	#resident = get_object_or_404(Resident, pk=resident_id)

def resident(request):
    return render(request, 'resident.html')
#try:
    #    resident = Resident.objects.get(pk=resident_id)
    #except Resident.DoesNotExist:
    #    raise Http404
    #return render(request, 'rotationSchedule_app/detail.html', {'resident': resident,})



