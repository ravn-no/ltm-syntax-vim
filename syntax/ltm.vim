" Vim syntax file
" Language:     LTM
" Maintainer:   Jan Schreiber <jans@ravn.no>
" Last Change:  Mi, 13 Apr 2008 22:40:09 CEST
" Filenames:    *.ltm
" Version:      0.3
" $Id$
"
" REFERENCES:
"    [1] http://www.ontopia.net/download/ltm.html

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Prefixes
syn match       ltmPrefix "#\(VERSION\|TOPICMAP\|MERGEMAP\|BASEURI\|INCLUDE\|VERSION\|PREFIX\)"

syn match       ltmName         "[A-Za-z_][-A-Za-z_0-9.]*\(:[A-Za-z_][-A-Za-z_0-9.]*\)\?"
syn match       ltmInlineName         "[A-Za-z_][-A-Za-z_0-9.]*\(:[A-Za-z_][-A-Za-z_0-9.]*\)\?" contained
syn match       ltmSubjectIdentifier '@"[^"]*"' contained
syn match       ltmSubjectLocator '%"[^"]*"' contained
syn match       ltmEncoding '@"[^"]*"'
syn match       ltmComma "," transparent contained
syn match       ltmColon ":" transparent contained

" Todo
syn keyword     ltmTodo todo fixme xxx  contained

" Comments
syn region      ltmComment      start="/\*" end="\*/"   contains=ltmTodo

syn region      ltmData      start="\[\[" end="\]\]" contained
syn region      ltmString      start="\"" end="\"" contained
syn region      ltmTopic      start="\[" end="\]" contains=ltmNameInline,ltmString,ltmSubjectIdentifier,ltmSubjectLocator,ltmComment keepend
syn region      ltmOccurrence      start="{" end="}" contains=ltmNameInline,ltmData,ltmString,ltmComment keepend
syn region      ltmAssociationBody      start="(" end=")" contains=ltmNameInline,ltmComment,ltmTopic,ltmColon,ltmComma,ltmOther keepend

if version < 508
  command -nargs=+ HiLink hi link <args>
else
  command -nargs=+ HiLink hi def link <args>
endif

HiLink         ltmComment      Comment
HiLink         ltmData         String
HiLink         ltmString       String
HiLink         ltmTodo         Todo
HiLink         ltmPrefix       Macro
HiLink         ltmSubjectIdentifier         Identifier
HiLink         ltmSubjectLocator         Identifier
HiLink         ltmInlineName          Function
HiLink         ltmEncoding     Special
HiLink         ltmTopic         Statement
HiLink         ltmOccurrence         Macro
HiLink         ltmAssociationBody         Structure
HiLink         ltmName         Structure

delcommand HiLink
" vim: ts=8
