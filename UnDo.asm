%macro print 2
  mov rax,1
  mov rdi,1
  mov rsi,%1
  mov rdx,%2
  syscall
%endmacro

%macro exit 0
   mov rax,60
   mov rdi,0
   syscall
%endmacro

section .data
   msg db 'Hex Value is :',0
section .bss
  char_ans resb 2
  
section .text
  global _start
  
_start:
  mov rax,20
  call display
  exit
  
display:
  mov rbx,16
  mov rcx,2
  mov rsi,char_ans+1
  
back:
  mov rdx,0
  
  div rbx; rax/rbx
  
  cmp dl,09h
  jbe add30
  add dl,07h
  
  add30:
  add dl,30h
  
  mov [rsi],dl
  dec rsi
  dec rcx
  jnz back
  
  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, 18
  syscall
  
  mov rax, 1
  mov rdi, 1
  mov rsi, char_ans
  mov rdx, 2
  ret
  
  
