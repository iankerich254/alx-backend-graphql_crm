#!/bin/bash

# Run Django shell command to delete inactive customers (no orders in last year)
deleted_count=$(python3 manage.py shell <<EOF
from crm.models import Customer
from django.utils import timezone
from datetime import timedelta

one_year_ago = timezone.now() - timedelta(days=365)
inactive_customers = Customer.objects.filter(order__isnull=True) | Customer.objects.exclude(order__order_date__gte=one_year_ago)
deleted, _ = inactive_customers.distinct().delete()
print(deleted)
EOF
)

# Log to file with timestamp
echo "$(date '+%Y-%m-%d %H:%M:%S') - Deleted $deleted_count customers" >> /tmp/customer_cleanup_log.txt
