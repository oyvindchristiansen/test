#!/bin/bash
inventoryfile=./ansible_inventory
[ -f ${inventoryfile} ] && rm -f ${inventoryfile}
categories=`grep ^10 /etc/hosts|awk '{ print $2 }'|sort|cut -d- -f1|uniq`
for c in ${categories}; do
  echo "[${c}]" >> ${inventoryfile}; grep ^10 /etc/hosts|awk '{ print $2 }'|sort|grep ${c} >> ${inventoryfile}
done
