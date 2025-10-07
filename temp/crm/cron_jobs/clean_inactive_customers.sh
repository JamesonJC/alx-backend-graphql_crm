#!/bin/bash

LOG_FILE="/tmp/customer_cleanup_log.txt"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Delete customers with no orders since a year ago
DELETED_COUNT=$(python manage.py shell -c "from crm.models import Customer; from django.utils import timezone; import datetime; cutoff=timezone.now() - datetime.timedelta(days=365); qs=Customer.objects.filter(orders__isnull=True, created_at__lte=cutoff); count=qs.count(); qs.delete(); print(count)")

echo "$TIMESTAMP - Deleted $DELETED_COUNT inactive customers" >> "$LOG_FILE"
