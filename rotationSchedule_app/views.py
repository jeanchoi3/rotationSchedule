from django.shortcuts import get_object_or_404, render, render_to_response
from django.http import Http404, HttpResponse, HttpResponseRedirect
from django.template import RequestContext, loader
from rotationSchedule_app.forms import ResidentForm, YearForm, TrackForm, ProgramForm, RotationForm, BlockForm, ScheduleForm, EventForm, TemplateForm, TemplateEventForm
import json
from django.core.management import call_command
from django.forms.models import modelformset_factory, inlineformset_factory
from rotationSchedule_app.models import Resident, Year, Track, Program, Rotation, Block, RotationLength, Event, Schedule, Event, Template, TemplateEvent
from django.views.decorators.csrf import ensure_csrf_cookie, csrf_exempt
from StringIO import StringIO

#could i try to associate the rotationlength with each rotation? so you can specify the length for each block
# Create your views here.

#http://stackoverflow.com/questions/11021242/accessing-many-to-many-through-relation-fields-in-formsets
def index(request):
    RotationLengthFormset = inlineformset_factory(Rotation, Block.includedRotation.through, extra=2)
    EducationReqFormset = inlineformset_factory(Rotation, Year.requiredRotations.through, extra=3)
    YearDemandFormset = inlineformset_factory(Rotation, Year.rotationDemand.through, extra=3)
    TrackEducationReqFormset = inlineformset_factory(Rotation, Track.trackRequiredRotations.through, extra=3)
    
    blocks = Block.objects.all()
    block_list = []

    for block in blocks:
        block_list.append({'title': str(block.name),
                            'length':str(block.length)})

    templates = Template.objects.all()
    template_list = []

    for template in templates:
        template_list.append({'name': str(template.templateName)})

    if request.method == 'POST':
        pForm = ProgramForm(request.POST) 
        rotationForm = RotationForm(request.POST)
        bForm = BlockForm(request.POST)
        yForm = YearForm(request.POST) 
        tForm = TrackForm(request.POST) 
        residentForm = ResidentForm(request.POST) #this is in the resident side....
        sForm = ScheduleForm(request.POST) 
        eForm = EventForm(request.POST) 
        templateForm = TemplateForm(request.POST) 
        tEventForm = TemplateEventForm(request.POST) 
        
        if 'rotation' in request.POST:
            if rotationForm.is_valid():
                rot = rotationForm.save()
                rotationLengthFormset = RotationLengthFormset(request.POST, instance=rot)
                educationReqFormset = EducationReqFormset(request.POST, instance=rot)
                yearDemandFormset = YearDemandFormset(request.POST, instance=rot)
                trackEducationReqFormset = TrackEducationReqFormset(request.POST, instance=rot)
                if rotationLengthFormset.is_valid():
                    rotationLengthFormset.save()
                if educationReqFormset.is_valid():
                    educationReqFormset.save()
                if yearDemandFormset.is_valid():
                    yearDemandFormset.save()
                if trackEducationReqFormset.is_valid():
                    trackEducationReqFormset.save()
                return HttpResponseRedirect('/')
        elif 'year' in request.POST:
            if yForm.is_valid():
                yForm.save()
                return HttpResponseRedirect('/')
        elif 'track' in request.POST:
            if tForm.is_valid():
                tForm.save()
                return HttpResponseRedirect('/')
        elif 'resident' in request.POST:
            if residentForm.is_valid():
                residentForm.save()
                return HttpResponseRedirect('/')
        elif 'event' in request.POST:
            if eForm.is_valid():
                eForm.save()
                return HttpResponseRedirect('/')
        elif 'block' in request.POST:
            if bForm.is_valid():
                bForm.save()
                return HttpResponseRedirect('/')
        elif 'program' in request.POST:
            if pForm.is_valid():
                pForm.save()
                return HttpResponseRedirect('/')
        elif 'template' in request.POST:
            if templateForm.is_valid():
                templateForm.save()
                return HttpResponseRedirect('/')
        elif 'template-event' in request.POST:
            if tEventForm.is_valid():
                tEventForm.save()
                return HttpResponseRedirect('/')
        elif 'multiple' in request.POST:
            if rotationForm.is_valid() and bForm.is_valid() and pForm.is_valid():
                rotationForm.save()
                bForm.save()
                yForm.save()
                return HttpResponseRedirect('/')
        else:
            return HttpResponse('<h1>Form not valid</h1>')
    else:
        rotationLengthFormset = RotationLengthFormset(instance=Rotation())
        educationReqFormset = EducationReqFormset(instance=Rotation())
        trackEducationReqFormset = TrackEducationReqFormset(instance=Rotation())
        yearDemandFormset = YearDemandFormset(instance=Rotation())
        pForm = ProgramForm()
        rotationForm = RotationForm()
        bForm = BlockForm()
        yForm = YearForm()
        tForm = TrackForm()
        residentForm = ResidentForm()
        sForm = ScheduleForm()
        eForm = EventForm()
        templateForm = TemplateForm()
        tEventForm = TemplateEventForm()
    context = {'template_list':template_list,'block_list':block_list,'pForm':pForm,'rotationForm':rotationForm,'bForm':bForm,'residentForm':residentForm,'yForm':yForm,'sForm':sForm,'eForm':eForm,'templateForm':templateForm,'tEventForm':tEventForm,'tForm':tForm,'rotationLengthFormset':rotationLengthFormset,'educationReqFormset':educationReqFormset,'yearDemandFormset':yearDemandFormset,'trackEducationReqFormset':trackEducationReqFormset}
    return render_to_response('rotationSchedule_app/index.html', context, context_instance=RequestContext(request))


'''def index(request):
    RotationFormSet = modelformset_factory(Rotation, form=RotationForm)
    #RotationLengthForm = inlineformset_factory(Rotation, Block.includedRotation.through)
    if request.method == 'POST':
        #rotation_formset = RotationFormSet(request.POST, prefix='rotations')
        #pForm = ProgramForm(request.POST)
        rotationForm = RotationForm(request.POST)
        bForm = BlockForm(request.POST)
        yForm = YearForm(request.POST)
        #RotationLengthForm = RotationLength(request.POST)
        if 'multiple' in request.POST:
            if rotationForm.is_valid() and bForm.is_valid() and yForm.is_valid():
                rotationForm.save()
                bForm.save()
                yForm.save()
                #RotationLengthForm.save()
                #rotation_formset.save()
                #rotation_instances = rotation_formset.save(commit=False)'''
                #rotation_instances = rotation_formset.save(commit=False)
                #print rotation_formset.deleted_objects
                #for instance in rotation_instances:
               # 	if instance not in rotation_formset.deleted_objects:
               # 		instance.save()'''
                #for instance in rotation_formset.deleted_objects:
                #	instance.delete()
                #for instance in rotation_formset.changed_objects:
               # 	instance.save()
                #for instance in rotation_formset.new_objects:
               # 	instance.save()'''
                #'''return HttpResponseRedirect('/')
        #else:
        #    return HttpResponse('<h1>Form not valid</h1>')
    #else:
        #pForm = ProgramForm()
        #rotationForm = RotationForm()
        #bForm = BlockForm()
        #yForm = BlockForm()
        #rotation_formset = RotationFormSet(prefix='rotations')
        #RotationLengthForm = RotationLength()
    #context = {'rotationForm':rotationForm,'bForm':bForm,'yForm':yForm}#'pForm':pForm,,'rotation_formset':rotation_formset}#,'RotationLengthForm':RotationLengthForm}
    #return render_to_response('rotationSchedule_app/index.html', context, context_instance=RequestContext(request))


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

#http://stackoverflow.com/questions/18113179/run-django-function-from-javascript-command
#http://stackoverflow.com/questions/3790335/calling-a-django-url-from-javascript

#@ensure_csrf_cookie


#        if request.POST['pk'] == 3:
#            response_data['yo']="You moved yu!!"
#        else:
@csrf_exempt
def changeEvent(request):
    if request.method == 'POST':
        response_data = {}
        #NOTE!! PK WILL BE A STRING WHEN IT COMES THROUGH!!
        event_match = Event.objects.filter(pk=int(request.POST['pk']))
        #try:
        #    replaced_event = Event.objects.get(resident=event_match[0].resident,startDate=request.POST['start'],endDate=request.POST['end'])
        #except Event.DoesNotExist:
        #    response_data['yo'] = "The res doesn't have a corresponding rotation at this time!"
        #    return HttpResponse(json.dumps(response_data),content_type="application/json")
        out = StringIO()
        call_command('check_hard_constraints', request.POST['pk'], request.POST['start'], request.POST['end'], stdout=out)
        response_data['outcome']=out.getvalue()

        #response_data['yo'] = str(replaced_event)

        #if request.POST['pk'] == '3':
        #    response_data['yo']="You moved yu!!"
        #else:
        #    out = StringIO()
        #    call_command('check_hard_constraints', stdout=out)
        #response_data['yo']=out.getvalue()
        #response_data['yo']=str(event_match[0].resident)
        return HttpResponse(json.dumps(response_data),content_type="application/json")
    else:
        return HttpResponse(json.dumps({"nothing to see": "this isn't happening"}),content_type="application/json")

    #json_data = json.dumps({"HTTPRESPONSE":1})
    #return HttpResponse(json_data, content_type="application/json")
    #print "yoyoyo"
    #return "Hi there!"
#if call_command('check_hard_constraints') == True:
#    else 


@csrf_exempt
def templateEvent(request):
    if request.method == 'POST':
        response_data = {}

        template_match = Template.objects.filter(templateName=request.POST['templateName'])
        block_match = Block.objects.filter(name=request.POST['blockName'])

        templateEvent = TemplateEvent.objects.create(block=block_match[0], template=template_match[0], blockStartDate=request.POST['start'], blockEndDate=request.POST['end'])

        response_data['eventId'] = str(templateEvent.pk)

        return HttpResponse(json.dumps(response_data),content_type="application/json")
    else:
        return HttpResponse(json.dumps({"nothing to see": "this isn't happening"}),content_type="application/json")


def schedule(request):
    #call_command('x')
    #programs = call_command('x')
    #context = {'programs':programs,}
    #return render_to_response('rotationSchedule_app/schedule.html', context, context_instance=RequestContext(request))

    # separating events by schedule
    schedules = Schedule.objects.all()
    schedule_list = []
####    schedule_events = dict()
    schedule_rotation_events = []
    schedule_resident_events = []

    rotations = Rotation.objects.all()
    rotation_list = []

    for rotation in rotations:
        rotation_list.append(str(rotation.name))

    residents = Resident.objects.all()
    resident_list = []

    for resident in residents:
        resident_list.append(str(resident.name))

    schedule_index = 0
    for schedule in schedules:
        schedule_list.append({'name': str(schedule.name),
                            'utility':str(schedule.utility)})
        #schedEvents = Event.objects.filter(schedule__name=str(schedule.name))
        
####        rot_res_dict = dict()
        rot_dict = []
        res_dict = []

#ARE ANY OF THE INDEX THINGS NECESSARY???????????????
        rotation_index = 0
        for rotation in rotation_list:
            rotation_event_list = []
            rotation_events = Event.objects.filter(schedule__name=str(schedule.name), rotation__name=rotation)
            for event in rotation_events:
                rotation_event_list.append({'title': str(event.resident),
                            'start':str(event.startDate),
                            'end':str(event.endDate),
                            'schedule':str(event.schedule),
                            'resident':str(event.resident),
                            'rotation':str(event.rotation),
                            'pk':event.pk})
            rot_dict.insert(rotation_index, rotation_event_list)
            rotation_index += 1
            ##BOTH THE ABOVE 2 LINES USED TO BE INDENTED ONCE MORE!!
####            rot_res_dict[rotation] = rotation_event_list
        schedule_rotation_events.insert(schedule_index, rot_dict)


        resident_index = 0
        for resident in resident_list:
            resident_event_list = []
            resident_events = Event.objects.filter(schedule__name=str(schedule.name), resident__name=resident)
            for event in resident_events:
                resident_event_list.append({'title': str(event.rotation),
                            'start':str(event.startDate),
                            'end':str(event.endDate),
                            'schedule':str(event.schedule),
                            'resident':str(event.resident),
                            'rotation':str(event.rotation),
                            'pk':event.pk})
            res_dict.insert(resident_index, resident_event_list)
            resident_index += 1

        schedule_index += 1
        schedule_resident_events.insert(schedule_index, res_dict)
####            rot_res_dict[resident] = resident_event_list


####            schedule_events[str(schedule.name)] = rot_res_dict

    context = {'schedule_rotation_events':json.dumps(schedule_rotation_events),'schedule_resident_events':json.dumps(schedule_resident_events),'schedule_list':json.dumps(schedule_list),'rotation_list':json.dumps(rotation_list),'resident_list':json.dumps(resident_list)}
    return render_to_response('schedule.html', context, context_instance=RequestContext(request))

    '''for event in schedEvents:
            posts_counts_temp.append({'title': str(event.resident),
                            'start':str(event.startDate),
                            'end':str(event.endDate)})
        schedule_events.append(posts_counts_temp)'''
'''
    events = Event.objects.all()
    posts_counts = []

    for event in events:
        posts_counts.append({'title': str(event.resident),
                            'start':str(event.startDate),
                            'end':str(event.endDate)})'''
    #http://stackoverflow.com/questions/10069997/using-jquery-fullcalendar-in-django-app
    #event_list = []
    #for event in events:
    #    event_list.append(str(event.resident_name))
    #context = {'events':events, 'posts_counts':json.dumps(posts_counts),'schedule_events':json.dumps(schedule_events),'schedule_list':json.dumps(schedule_list)}


    #return render(request, 'schedule.html')
	#resident = get_object_or_404(Resident, pk=resident_id)

def resident(request):
    if request.method == 'POST':
        resForm = ResidentForm(request.POST)
        if 'personal' in request.POST:
            if resForm.is_valid():
                resForm.save()
                return HttpResponseRedirect('/resident/')
        else:
            return HttpResponse('<h1>Form not valid</h1>')
    else:
        resForm = ResidentForm()
    context = {'resForm':resForm}
    return render_to_response('rotationSchedule_app/resident.html', context, context_instance=RequestContext(request))
#    return render(request, 'resident.html')
#try:
    #    resident = Resident.objects.get(pk=resident_id)
    #except Resident.DoesNotExist:
    #    raise Http404
    #return render(request, 'rotationSchedule_app/detail.html', {'resident': resident,})


 
