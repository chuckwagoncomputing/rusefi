@echo off
sh.exe gen_upload_docs.sh || (
  if exist C:\cygwin64 (
    C:\cygwin64\bin\sh.exe gen_upload_docs.sh
  ) else (
    if exist C:\cygwin ( C:\cygwin\bin\sh.exe gen_upload_docs.sh )
  )
)
