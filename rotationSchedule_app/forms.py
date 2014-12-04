from django.forms import ModelForm
from rotationSchedule_app.models import Resident, Year, Track, Program, Rotation

class ResidentForm(ModelForm):
    class Meta:
        model = Resident

class YearForm(ModelForm):
    class Meta:
        model = Year

class TrackForm(ModelForm):
    class Meta:
        model = Track

class ProgramForm(ModelForm):
    class Meta:
        model = Program

class RotationForm(ModelForm):
    class Meta:
        model = Rotation