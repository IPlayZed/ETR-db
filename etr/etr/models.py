# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Felvetel(models.Model):
    etr = models.ForeignKey('Hallgato', models.DO_NOTHING)
    kurzus = models.ForeignKey('Kurzus', models.DO_NOTHING)
    fevetelek_szama = models.PositiveIntegerField()
    idopont = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'felvetel'
        unique_together = (('etr', 'kurzus'), ('etr', 'kurzus'),)


class Gepterem(models.Model):
    teremszam = models.OneToOneField('Terem', models.DO_NOTHING, db_column='teremszam', primary_key=True)
    ferohel = models.PositiveIntegerField(blank=True, null=True)
    cim = models.CharField(max_length=50, blank=True, null=True)
    gepek_szama = models.PositiveIntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'gepterem'


class Hallgato(models.Model):
    hallgato_etr_id = models.CharField(primary_key=True, max_length=6)
    lakhely = models.CharField(max_length=100, blank=True, null=True)
    tagozat_forma = models.CharField(max_length=1)
    koltsegteritesi_forma = models.CharField(max_length=1)
    vezeteknev = models.CharField(max_length=30)
    keresztnev = models.CharField(max_length=30)
    titulus = models.CharField(max_length=5, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'hallgato'


class Kurzus(models.Model):
    kurzus_id = models.CharField(primary_key=True, max_length=6)
    kreditszam = models.PositiveIntegerField(blank=True, null=True)
    maximum_letszam = models.PositiveIntegerField(blank=True, null=True)
    letszam = models.PositiveIntegerField(blank=True, null=True)
    teremszam = models.ForeignKey('Terem', models.DO_NOTHING, db_column='teremszam')
    targykod = models.ForeignKey('Targy', models.DO_NOTHING, db_column='targykod')
    oktato_etr = models.ForeignKey('Oktato', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'kurzus'


class Leadas(models.Model):
    etr = models.ForeignKey(Hallgato, models.DO_NOTHING)
    kurzus = models.ForeignKey(Kurzus, models.DO_NOTHING)
    idopont = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'leadas'
        unique_together = (('etr', 'kurzus'), ('etr', 'kurzus'),)


class Oktato(models.Model):
    oktato_etr_id = models.CharField(primary_key=True, max_length=6)
    vezeteknev = models.CharField(max_length=30)
    keresztnev = models.CharField(max_length=30)
    titulus = models.CharField(max_length=5, blank=True, null=True)
    beosztas = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'oktato'


class Targy(models.Model):
    targykod = models.CharField(primary_key=True, max_length=6)
    ajanlott_felev = models.PositiveIntegerField(blank=True, null=True)
    nev = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'targy'


class Terem(models.Model):
    teremszam = models.CharField(primary_key=True, max_length=6)
    ferohely = models.PositiveIntegerField(blank=True, null=True)
    cim = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'terem'
