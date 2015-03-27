from django.forms import ModelForm
from rotationSchedule_app.models import Resident, Year, Track, Program, Rotation, Block, Schedule, Event, Template, TemplateEvent
from django.utils.translation import ugettext_lazy as _

class ShortResidentForm(ModelForm):
    class Meta:
        model = Resident
        fields = ['name','email','year','tracks']
    def __init__(self, *args, **kwargs):
        super(ShortResidentForm, self).__init__(*args, **kwargs)
        self.fields['email'].widget.attrs.update({'required':True})


class ResidentForm(ModelForm):
    class Meta:
        model = Resident
        exclude=('inProgram',)
        #fields = ['name','year','tracks','vacationStart1','vacationEnd1','vacationStart2','vacationEnd2','vacationStart3','vacationEnd3','elective1','elective2','elective3','elective4','vacationPreference']
        labels = {
            'vacationStart1': _('Vacation Option 1, Start'),
            'vacationStart2': _('Vacation Option 2, Start'),
            'vacationStart3': _('Vacation Option 3, Start'),
            'vacationEnd1': _('Vacation Option 1, End'),
            'vacationEnd2': _('Vacation Option 2, End'),
            'vacationEnd3': _('Vacation Option 3, End'),
            'elective1': _('Elective Option 1'),
            'elective2': _('Elective Option 2'),
            'elective3': _('Elective Option 3'),
            'elective4': _('Elective Option 4')
        }

    def __init__(self, *args, **kwargs):
        super(ResidentForm, self).__init__(*args, **kwargs)
        self.fields['vacationStart1'].widget.attrs.update({'id': 'vacationStart1'})
        self.fields['vacationStart2'].widget.attrs.update({'id': 'vacationStart2'})
        self.fields['vacationStart3'].widget.attrs.update({'id': 'vacationStart3'})
        self.fields['vacationEnd1'].widget.attrs.update({'id': 'vacationEnd1'})
        self.fields['vacationEnd2'].widget.attrs.update({'id': 'vacationEnd2'})
        self.fields['name'].widget.attrs.update({'required':True})

class YearForm(ModelForm):
    class Meta:
        model = Year
        exclude=['requiredRotations','rotationDemand']
        labels = {
            'yearNum': _('Post-grad year'),
        }
    def __init__(self, *args, **kwargs):
        super(YearForm, self).__init__(*args, **kwargs)
        self.fields['yearNum'].widget.attrs.update({'required':True,'placeholder':'E.g. 1 for Intern Year'})

class TrackForm(ModelForm):
    class Meta:
        model = Track
        exclude=['trackRequiredRotations']

class ProgramForm(ModelForm):
    class Meta:
        model = Program
        fields = ['name','startDate','endDate','minClinicWeeks','windowSize']
        labels = {
            'startDate': _('Start Date'),
            'endDate': _('End Date'),
            'windowSize': _('Total number of weeks in an X+Y schedule (e.g. 6 for a 4+2 schedule)'),
            'minClinicWeeks': _('Minimum required number of clinic weeks in a window, e.g. Y in an X+Y schedule')
        }

    def __init__(self, *args, **kwargs):
        super(ProgramForm, self).__init__(*args, **kwargs)
        self.fields['startDate'].widget.attrs.update({'id': 'datepicker-1','required':True})
        self.fields['endDate'].widget.attrs.update({'id': 'datepicker-2','required':True})
        self.fields['name'].widget.attrs.update({'id': 'program-name','placeholder':'E.g. Penn Neurology','required':True})

class RotationForm(ModelForm):
    class Meta:
        model = Rotation
        #fields = ['name','minResidents','maxResidents']
        labels = {
            'minResidents': _('Min Total # Residents'),
            'maxResidents': _('Max Total # Residents'),
            'isElective': _('Elective')
        }
    def __init__(self, *args, **kwargs):
        super(RotationForm, self).__init__(*args, **kwargs)
        self.fields['name'].widget.attrs.update({'required':True})
        self.fields['minResidents'].widget.attrs.update({'required':True})
        self.fields['maxResidents'].widget.attrs.update({'required':True})


class BlockForm(ModelForm):
    class Meta:
        model = Block
        exclude=('includedRotation',)
        #fields = ['name','length']
        labels = {
            'name': _('Block Name'),
            'length': _('Block Length (Weeks)'),
            'maxNumRotations':  _('Max # Rotations Scheduled in Block')
            #'includedRotation': _('Included Rotation')
        }
    def __init__(self, *args, **kwargs):
        super(BlockForm, self).__init__(*args, **kwargs)
        self.fields['name'].widget.attrs.update({'required':True,'placeholder':'E.g. Four-week block'})
        self.fields['length'].widget.attrs.update({'required':True})


class ScheduleForm(ModelForm):
    class Meta:
        model = Schedule

class EventForm(ModelForm):
    class Meta:
        model = Event

class TemplateForm(ModelForm):
    class Meta:
        model = Template

class TemplateEventForm(ModelForm):
    class Meta:
        model = TemplateEvent

'''# -*- coding: utf-8 -*-
import functools
from import_export import resources, widgets, fields
from django.db.models.fields.related import ForeignKey

class IntermediateModelManyToManyWidget(widgets.ManyToManyWidget):

    def __init__(self, *args, **kwargs):
        self.rel = kwargs.pop('rel', None)
        super(IntermediateModelManyToManyWidget, self).__init__(*args,
                                                                **kwargs)

    def clean(self, value):
        ids = [item["uid"] for item in value]
        objects = self.model.objects.filter(**{
            '%s__in' % self.field: ids
        })
        return objects

    def render(self, value, obj):
        return [self.related_object_representation(obj, related_obj)
                for related_obj in value.all()]

    def related_object_representation(self, obj, related_obj):
        result = {
            "uid": related_obj.uid,
            "name": related_obj.name
        }
        if self.rel.through._meta.auto_created:
            return result
        intermediate_own_fields = [
            field for field in self.rel.through._meta.fields
            if field is not self.rel.through._meta.pk
            and not isinstance(field, ForeignKey)
        ]
        for field in intermediate_own_fields:
            result[field.name] = "foo"
        set_name = "{}_set".format(self.rel.through._meta.model_name)
        related_field_name = self.rel.to._meta.model_name
        intermediate_set = getattr(obj, set_name)
        intermediate_obj = intermediate_set.filter(**{
            related_field_name: related_obj
        }).first()
        for field in intermediate_own_fields:
            result[field.name] = getattr(intermediate_obj, field.name)
        return result


class Field(fields.Field):

    def is_m2m_with_intermediate_object(self, obj):
        field, _, _, m2m = obj._meta.get_field_by_name(self.attribute)
        return m2m and field.rel.through._meta.auto_created is False

    def get_intermediate_model(self, obj):
        field = obj._meta.get_field_by_name(self.attribute)[0]
        IntermediateModel = field.rel.through
        from_field_name = field.m2m_field_name()
        to_field_name = field.rel.to.__name__.lower()
        return IntermediateModel, from_field_name, to_field_name

    def remove_old_intermediates(self, obj, data):
        IntermediateModel, from_field_name, to_field_name = \
            self.get_intermediate_model(obj)
        imported_ids = set(import_obj.pk for import_obj in self.clean(data))
        related_objects = getattr(obj, self.attribute).all()
        for related_object in related_objects:
            if related_object.pk not in imported_ids:
                queryset = IntermediateModel.objects.filter(**{
                    from_field_name: obj,
                    to_field_name: related_object
                })
                queryset.delete()

    def ensure_current_intermediates_created(self, obj, data):
        IntermediateModel, from_field_name, to_field_name = \
            self.get_intermediate_model(obj)

        for related_object in self.clean(data):
            attributes = {from_field_name: obj, to_field_name: related_object}
            self.create_if_not_existing(IntermediateModel, attributes)

    @staticmethod
    def create_if_not_existing(IntermediateModel, attributes):
        # Use this instead of get_or_create in case we have duplicate
        # associations. (get_or_create would raise a DoesNotExist exception)
        if not IntermediateModel.objects.filter(**attributes).exists():
            IntermediateModel.objects.create(**attributes)

    def save(self, obj, data):
        """
        Cleans this field value and assign it to provided object.
        """
        if not self.readonly:
            if self.is_m2m_with_intermediate_object(obj):
                self.remove_old_intermediates(obj, data)
                self.ensure_current_intermediates_created(obj, data)
            else:
                setattr(obj, self.attribute, self.clean(data))

    def export(self, obj):
        """
        Returns value from the provided object converted to export
        representation.
        """
        value = self.get_value(obj)
        if value is None:
            return ""
        if isinstance(self.widget, IntermediateModelManyToManyWidget):
            return self.widget.render(value, obj)
        else:
            return self.widget.render(value)


class ModelResource(resources.ModelResource):

    @classmethod
    def widget_from_django_field(cls, f, default=widgets.Widget):
        """
        Returns the widget that would likely be associated with each
        Django type.
        """
        result = default
        internal_type = f.get_internal_type()
        if internal_type in ('ManyToManyField', ):
            result = functools.partial(IntermediateModelManyToManyWidget,
                                       model=f.rel.to, rel=f.rel)
        if internal_type in ('ForeignKey', 'OneToOneField', ):
            result = functools.partial(widgets.ForeignKeyWidget,
                                       model=f.rel.to)
        if internal_type in ('DecimalField', ):
            result = widgets.DecimalWidget
        if internal_type in ('DateTimeField', ):
            result = widgets.DateTimeWidget
        elif internal_type in ('DateField', ):
            result = widgets.DateWidget
        elif internal_type in ('IntegerField', 'PositiveIntegerField',
                               'PositiveSmallIntegerField',
                               'SmallIntegerField', 'AutoField'):
            result = widgets.IntegerWidget
        elif internal_type in ('BooleanField', 'NullBooleanField'):
            result = widgets.BooleanWidget
        return result


    @classmethod
    def field_from_django_field(self, field_name, django_field, readonly):
        """
        Returns a Resource Field instance for the given Django model field.
        """

        FieldWidget = self.widget_from_django_field(django_field)
        widget_kwargs = self.widget_kwargs_for_field(field_name)
        field = Field(attribute=field_name, column_name=field_name,
                      widget=FieldWidget(**widget_kwargs), readonly=readonly)
        return field'''



