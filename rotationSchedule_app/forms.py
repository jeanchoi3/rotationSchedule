from django.forms import ModelForm
from rotationSchedule_app.models import Resident, Year

class ResidentForm(ModelForm):
    class Meta:
        model = Resident

class YearForm(ModelForm):
    class Meta:
        model = Year