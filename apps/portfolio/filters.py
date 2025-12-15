from django.db.models import fields
import django_filters
from django_filters.filters import DateFilter, CharFilter

from .models import *


class PostFilter(django_filters.FilterSet):
    start_date = DateFilter(label='Deste', field_name="timestamp",
                            lookup_expr='gte')
    end_date = DateFilter(label='Hasta', field_name="timestamp",
                          lookup_expr='lte')
    title = CharFilter(field_name='title',
                       lookup_expr='icontains', label='Titulo')

    class Meta:

        model = Post

        fields = ('author',)
