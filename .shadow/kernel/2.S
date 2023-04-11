
build/test:     file format elf64-x86-64


Disassembly of section .init:

0000000000003000 <_init>:
    3000:	f3 0f 1e fa          	endbr64
    3004:	48 83 ec 08          	sub    $0x8,%rsp
    3008:	48 8b 05 c9 7f 00 00 	mov    0x7fc9(%rip),%rax        # afd8 <__gmon_start__@Base>
    300f:	48 85 c0             	test   %rax,%rax
    3012:	74 02                	je     3016 <_init+0x16>
    3014:	ff d0                	call   *%rax
    3016:	48 83 c4 08          	add    $0x8,%rsp
    301a:	c3                   	ret

Disassembly of section .plt:

0000000000003020 <__asan_report_store4@plt-0x10>:
    3020:	ff 35 ca 7f 00 00    	push   0x7fca(%rip)        # aff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    3026:	ff 25 cc 7f 00 00    	jmp    *0x7fcc(%rip)        # aff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    302c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000003030 <__asan_report_store4@plt>:
    3030:	ff 25 ca 7f 00 00    	jmp    *0x7fca(%rip)        # b000 <__asan_report_store4@Base>
    3036:	68 00 00 00 00       	push   $0x0
    303b:	e9 e0 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003040 <printf@plt>:
    3040:	ff 25 c2 7f 00 00    	jmp    *0x7fc2(%rip)        # b008 <printf@Base>
    3046:	68 01 00 00 00       	push   $0x1
    304b:	e9 d0 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003050 <__asan_register_globals@plt>:
    3050:	ff 25 ba 7f 00 00    	jmp    *0x7fba(%rip)        # b010 <__asan_register_globals@Base>
    3056:	68 02 00 00 00       	push   $0x2
    305b:	e9 c0 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003060 <__asan_stack_malloc_0@plt>:
    3060:	ff 25 b2 7f 00 00    	jmp    *0x7fb2(%rip)        # b018 <__asan_stack_malloc_0@Base>
    3066:	68 03 00 00 00       	push   $0x3
    306b:	e9 b0 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003070 <pthread_create@plt>:
    3070:	ff 25 aa 7f 00 00    	jmp    *0x7faa(%rip)        # b020 <pthread_create@Base>
    3076:	68 04 00 00 00       	push   $0x4
    307b:	e9 a0 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003080 <puts@plt>:
    3080:	ff 25 a2 7f 00 00    	jmp    *0x7fa2(%rip)        # b028 <puts@Base>
    3086:	68 05 00 00 00       	push   $0x5
    308b:	e9 90 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003090 <__asan_report_load4@plt>:
    3090:	ff 25 9a 7f 00 00    	jmp    *0x7f9a(%rip)        # b030 <__asan_report_load4@Base>
    3096:	68 06 00 00 00       	push   $0x6
    309b:	e9 80 ff ff ff       	jmp    3020 <_init+0x20>

00000000000030a0 <__assert_fail@plt>:
    30a0:	ff 25 92 7f 00 00    	jmp    *0x7f92(%rip)        # b038 <__assert_fail@GLIBC_2.2.5>
    30a6:	68 07 00 00 00       	push   $0x7
    30ab:	e9 70 ff ff ff       	jmp    3020 <_init+0x20>

00000000000030b0 <memset@plt>:
    30b0:	ff 25 8a 7f 00 00    	jmp    *0x7f8a(%rip)        # b040 <memset@Base>
    30b6:	68 08 00 00 00       	push   $0x8
    30bb:	e9 60 ff ff ff       	jmp    3020 <_init+0x20>

00000000000030c0 <pthread_self@plt>:
    30c0:	ff 25 82 7f 00 00    	jmp    *0x7f82(%rip)        # b048 <pthread_self@GLIBC_2.2.5>
    30c6:	68 09 00 00 00       	push   $0x9
    30cb:	e9 50 ff ff ff       	jmp    3020 <_init+0x20>

00000000000030d0 <__asan_report_store8@plt>:
    30d0:	ff 25 7a 7f 00 00    	jmp    *0x7f7a(%rip)        # b050 <__asan_report_store8@Base>
    30d6:	68 0a 00 00 00       	push   $0xa
    30db:	e9 40 ff ff ff       	jmp    3020 <_init+0x20>

00000000000030e0 <__asan_unregister_globals@plt>:
    30e0:	ff 25 72 7f 00 00    	jmp    *0x7f72(%rip)        # b058 <__asan_unregister_globals@Base>
    30e6:	68 0b 00 00 00       	push   $0xb
    30eb:	e9 30 ff ff ff       	jmp    3020 <_init+0x20>

00000000000030f0 <__asan_handle_no_return@plt>:
    30f0:	ff 25 6a 7f 00 00    	jmp    *0x7f6a(%rip)        # b060 <__asan_handle_no_return@Base>
    30f6:	68 0c 00 00 00       	push   $0xc
    30fb:	e9 20 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003100 <__asan_init@plt>:
    3100:	ff 25 62 7f 00 00    	jmp    *0x7f62(%rip)        # b068 <__asan_init@Base>
    3106:	68 0d 00 00 00       	push   $0xd
    310b:	e9 10 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003110 <malloc@plt>:
    3110:	ff 25 5a 7f 00 00    	jmp    *0x7f5a(%rip)        # b070 <malloc@Base>
    3116:	68 0e 00 00 00       	push   $0xe
    311b:	e9 00 ff ff ff       	jmp    3020 <_init+0x20>

0000000000003120 <__asan_report_load1@plt>:
    3120:	ff 25 52 7f 00 00    	jmp    *0x7f52(%rip)        # b078 <__asan_report_load1@Base>
    3126:	68 0f 00 00 00       	push   $0xf
    312b:	e9 f0 fe ff ff       	jmp    3020 <_init+0x20>

0000000000003130 <__asan_report_store1@plt>:
    3130:	ff 25 4a 7f 00 00    	jmp    *0x7f4a(%rip)        # b080 <__asan_report_store1@Base>
    3136:	68 10 00 00 00       	push   $0x10
    313b:	e9 e0 fe ff ff       	jmp    3020 <_init+0x20>

0000000000003140 <__asan_report_load8@plt>:
    3140:	ff 25 42 7f 00 00    	jmp    *0x7f42(%rip)        # b088 <__asan_report_load8@Base>
    3146:	68 11 00 00 00       	push   $0x11
    314b:	e9 d0 fe ff ff       	jmp    3020 <_init+0x20>

0000000000003150 <__asan_version_mismatch_check_v8@plt>:
    3150:	ff 25 3a 7f 00 00    	jmp    *0x7f3a(%rip)        # b090 <__asan_version_mismatch_check_v8@Base>
    3156:	68 12 00 00 00       	push   $0x12
    315b:	e9 c0 fe ff ff       	jmp    3020 <_init+0x20>

0000000000003160 <pthread_join@plt>:
    3160:	ff 25 32 7f 00 00    	jmp    *0x7f32(%rip)        # b098 <pthread_join@Base>
    3166:	68 13 00 00 00       	push   $0x13
    316b:	e9 b0 fe ff ff       	jmp    3020 <_init+0x20>

0000000000003170 <__asan_report_store_n@plt>:
    3170:	ff 25 2a 7f 00 00    	jmp    *0x7f2a(%rip)        # b0a0 <__asan_report_store_n@Base>
    3176:	68 14 00 00 00       	push   $0x14
    317b:	e9 a0 fe ff ff       	jmp    3020 <_init+0x20>

Disassembly of section .text:

0000000000003180 <_start>:
    3180:	f3 0f 1e fa          	endbr64
    3184:	31 ed                	xor    %ebp,%ebp
    3186:	49 89 d1             	mov    %rdx,%r9
    3189:	5e                   	pop    %rsi
    318a:	48 89 e2             	mov    %rsp,%rdx
    318d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    3191:	50                   	push   %rax
    3192:	54                   	push   %rsp
    3193:	45 31 c0             	xor    %r8d,%r8d
    3196:	31 c9                	xor    %ecx,%ecx
    3198:	48 8d 3d 9f 3d 00 00 	lea    0x3d9f(%rip),%rdi        # 6f3e <main>
    319f:	ff 15 23 7e 00 00    	call   *0x7e23(%rip)        # afc8 <__libc_start_main@GLIBC_2.34>
    31a5:	f4                   	hlt
    31a6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    31ad:	00 00 00 
    31b0:	48 8d 3d 29 99 00 00 	lea    0x9929(%rip),%rdi        # cae0 <__asan_option_detect_stack_use_after_return@@Base>
    31b7:	48 8d 05 22 99 00 00 	lea    0x9922(%rip),%rax        # cae0 <__asan_option_detect_stack_use_after_return@@Base>
    31be:	48 39 f8             	cmp    %rdi,%rax
    31c1:	74 15                	je     31d8 <_start+0x58>
    31c3:	48 8b 05 06 7e 00 00 	mov    0x7e06(%rip),%rax        # afd0 <_ITM_deregisterTMCloneTable@Base>
    31ca:	48 85 c0             	test   %rax,%rax
    31cd:	74 09                	je     31d8 <_start+0x58>
    31cf:	ff e0                	jmp    *%rax
    31d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    31d8:	c3                   	ret
    31d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    31e0:	48 8d 3d f9 98 00 00 	lea    0x98f9(%rip),%rdi        # cae0 <__asan_option_detect_stack_use_after_return@@Base>
    31e7:	48 8d 35 f2 98 00 00 	lea    0x98f2(%rip),%rsi        # cae0 <__asan_option_detect_stack_use_after_return@@Base>
    31ee:	48 29 fe             	sub    %rdi,%rsi
    31f1:	48 89 f0             	mov    %rsi,%rax
    31f4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    31f8:	48 c1 f8 03          	sar    $0x3,%rax
    31fc:	48 01 c6             	add    %rax,%rsi
    31ff:	48 d1 fe             	sar    %rsi
    3202:	74 14                	je     3218 <_start+0x98>
    3204:	48 8b 05 d5 7d 00 00 	mov    0x7dd5(%rip),%rax        # afe0 <_ITM_registerTMCloneTable@Base>
    320b:	48 85 c0             	test   %rax,%rax
    320e:	74 08                	je     3218 <_start+0x98>
    3210:	ff e0                	jmp    *%rax
    3212:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3218:	c3                   	ret
    3219:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3220:	f3 0f 1e fa          	endbr64
    3224:	80 3d b9 98 00 00 00 	cmpb   $0x0,0x98b9(%rip)        # cae4 <__asan_option_detect_stack_use_after_return+0x4>
    322b:	75 33                	jne    3260 <_start+0xe0>
    322d:	55                   	push   %rbp
    322e:	48 83 3d 8a 7d 00 00 	cmpq   $0x0,0x7d8a(%rip)        # afc0 <__cxa_finalize@GLIBC_2.2.5>
    3235:	00 
    3236:	48 89 e5             	mov    %rsp,%rbp
    3239:	74 0d                	je     3248 <_start+0xc8>
    323b:	48 8b 3d 86 7e 00 00 	mov    0x7e86(%rip),%rdi        # b0c8 <__dso_handle>
    3242:	ff 15 78 7d 00 00    	call   *0x7d78(%rip)        # afc0 <__cxa_finalize@GLIBC_2.2.5>
    3248:	e8 63 ff ff ff       	call   31b0 <_start+0x30>
    324d:	c6 05 90 98 00 00 01 	movb   $0x1,0x9890(%rip)        # cae4 <__asan_option_detect_stack_use_after_return+0x4>
    3254:	5d                   	pop    %rbp
    3255:	c3                   	ret
    3256:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    325d:	00 00 00 
    3260:	c3                   	ret
    3261:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    3268:	00 00 00 00 
    326c:	0f 1f 40 00          	nopl   0x0(%rax)
    3270:	f3 0f 1e fa          	endbr64
    3274:	e9 67 ff ff ff       	jmp    31e0 <_start+0x60>

0000000000003279 <cpu_current>:
    3279:	55                   	push   %rbp
    327a:	48 89 e5             	mov    %rsp,%rbp
    327d:	e8 3e fe ff ff       	call   30c0 <pthread_self@plt>
    3282:	5d                   	pop    %rbp
    3283:	c3                   	ret

0000000000003284 <wrapper>:
    3284:	55                   	push   %rbp
    3285:	48 89 e5             	mov    %rsp,%rbp
    3288:	48 83 ec 20          	sub    $0x20,%rsp
    328c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    3290:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3294:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    3298:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    329c:	48 83 c0 10          	add    $0x10,%rax
    32a0:	48 89 c2             	mov    %rax,%rdx
    32a3:	48 c1 ea 03          	shr    $0x3,%rdx
    32a7:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    32ae:	0f b6 12             	movzbl (%rdx),%edx
    32b1:	84 d2                	test   %dl,%dl
    32b3:	74 08                	je     32bd <wrapper+0x39>
    32b5:	48 89 c7             	mov    %rax,%rdi
    32b8:	e8 83 fe ff ff       	call   3140 <__asan_report_load8@plt>
    32bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    32c1:	48 8b 48 10          	mov    0x10(%rax),%rcx
    32c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    32c9:	48 89 c2             	mov    %rax,%rdx
    32cc:	48 89 d0             	mov    %rdx,%rax
    32cf:	48 c1 e8 03          	shr    $0x3,%rax
    32d3:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    32d9:	0f b6 00             	movzbl (%rax),%eax
    32dc:	84 c0                	test   %al,%al
    32de:	40 0f 95 c6          	setne  %sil
    32e2:	3c 03                	cmp    $0x3,%al
    32e4:	0f 9e c0             	setle  %al
    32e7:	21 f0                	and    %esi,%eax
    32e9:	84 c0                	test   %al,%al
    32eb:	74 08                	je     32f5 <wrapper+0x71>
    32ed:	48 89 d7             	mov    %rdx,%rdi
    32f0:	e8 9b fd ff ff       	call   3090 <__asan_report_load4@plt>
    32f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    32f9:	8b 00                	mov    (%rax),%eax
    32fb:	89 c7                	mov    %eax,%edi
    32fd:	ff d1                	call   *%rcx
    32ff:	b8 00 00 00 00       	mov    $0x0,%eax
    3304:	c9                   	leave
    3305:	c3                   	ret

0000000000003306 <create>:
    3306:	55                   	push   %rbp
    3307:	48 89 e5             	mov    %rsp,%rbp
    330a:	48 83 ec 30          	sub    $0x30,%rsp
    330e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    3312:	48 8b 15 c7 7d 00 00 	mov    0x7dc7(%rip),%rdx        # b0e0 <tptr>
    3319:	48 8d 05 e0 97 00 00 	lea    0x97e0(%rip),%rax        # cb00 <tpool>
    3320:	48 29 c2             	sub    %rax,%rdx
    3323:	48 81 fa e8 05 00 00 	cmp    $0x5e8,%rdx
    332a:	7e 2d                	jle    3359 <create+0x53>
    332c:	e8 bf fd ff ff       	call   30f0 <__asan_handle_no_return@plt>
    3331:	48 8d 05 c8 53 00 00 	lea    0x53c8(%rip),%rax        # 8700 <__PRETTY_FUNCTION__.9>
    3338:	48 89 c1             	mov    %rax,%rcx
    333b:	ba 28 00 00 00       	mov    $0x28,%edx
    3340:	48 8d 05 d9 4c 00 00 	lea    0x4cd9(%rip),%rax        # 8020 <_IO_stdin_used+0x20>
    3347:	48 89 c6             	mov    %rax,%rsi
    334a:	48 8d 05 0f 4d 00 00 	lea    0x4d0f(%rip),%rax        # 8060 <_IO_stdin_used+0x60>
    3351:	48 89 c7             	mov    %rax,%rdi
    3354:	e8 47 fd ff ff       	call   30a0 <__assert_fail@plt>
    3359:	48 8b 05 80 7d 00 00 	mov    0x7d80(%rip),%rax        # b0e0 <tptr>
    3360:	48 8b 0d 79 7d 00 00 	mov    0x7d79(%rip),%rcx        # b0e0 <tptr>
    3367:	48 8d 15 92 97 00 00 	lea    0x9792(%rip),%rdx        # cb00 <tpool>
    336e:	48 29 d1             	sub    %rdx,%rcx
    3371:	48 c1 f9 03          	sar    $0x3,%rcx
    3375:	48 ba ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rdx
    337c:	aa aa aa 
    337f:	48 0f af d1          	imul   %rcx,%rdx
    3383:	83 c2 01             	add    $0x1,%edx
    3386:	41 89 d0             	mov    %edx,%r8d
    3389:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
    338d:	48 89 c2             	mov    %rax,%rdx
    3390:	48 89 d1             	mov    %rdx,%rcx
    3393:	48 c1 e9 03          	shr    $0x3,%rcx
    3397:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    339e:	0f b6 09             	movzbl (%rcx),%ecx
    33a1:	84 c9                	test   %cl,%cl
    33a3:	40 0f 95 c6          	setne  %sil
    33a7:	84 c9                	test   %cl,%cl
    33a9:	0f 9e c1             	setle  %cl
    33ac:	21 ce                	and    %ecx,%esi
    33ae:	41 89 f1             	mov    %esi,%r9d
    33b1:	b9 18 00 00 00       	mov    $0x18,%ecx
    33b6:	48 83 e9 01          	sub    $0x1,%rcx
    33ba:	48 8d 34 0a          	lea    (%rdx,%rcx,1),%rsi
    33be:	48 89 f1             	mov    %rsi,%rcx
    33c1:	48 c1 e9 03          	shr    $0x3,%rcx
    33c5:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    33cc:	0f b6 09             	movzbl (%rcx),%ecx
    33cf:	84 c9                	test   %cl,%cl
    33d1:	41 0f 95 c2          	setne  %r10b
    33d5:	83 e6 07             	and    $0x7,%esi
    33d8:	40 38 ce             	cmp    %cl,%sil
    33db:	0f 9d c1             	setge  %cl
    33de:	44 21 d1             	and    %r10d,%ecx
    33e1:	44 09 c9             	or     %r9d,%ecx
    33e4:	84 c9                	test   %cl,%cl
    33e6:	74 0d                	je     33f5 <create+0xef>
    33e8:	be 18 00 00 00       	mov    $0x18,%esi
    33ed:	48 89 d7             	mov    %rdx,%rdi
    33f0:	e8 7b fd ff ff       	call   3170 <__asan_report_store_n@plt>
    33f5:	66 0f ef c0          	pxor   %xmm0,%xmm0
    33f9:	0f 11 00             	movups %xmm0,(%rax)
    33fc:	66 0f d6 40 10       	movq   %xmm0,0x10(%rax)
    3401:	48 89 c2             	mov    %rax,%rdx
    3404:	48 89 d1             	mov    %rdx,%rcx
    3407:	48 89 ca             	mov    %rcx,%rdx
    340a:	48 c1 ea 03          	shr    $0x3,%rdx
    340e:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3415:	0f b6 12             	movzbl (%rdx),%edx
    3418:	84 d2                	test   %dl,%dl
    341a:	40 0f 95 c6          	setne  %sil
    341e:	80 fa 03             	cmp    $0x3,%dl
    3421:	0f 9e c2             	setle  %dl
    3424:	21 f2                	and    %esi,%edx
    3426:	84 d2                	test   %dl,%dl
    3428:	74 08                	je     3432 <create+0x12c>
    342a:	48 89 cf             	mov    %rcx,%rdi
    342d:	e8 fe fb ff ff       	call   3030 <__asan_report_store4@plt>
    3432:	44 89 00             	mov    %r8d,(%rax)
    3435:	48 8d 50 04          	lea    0x4(%rax),%rdx
    3439:	48 89 d1             	mov    %rdx,%rcx
    343c:	48 c1 e9 03          	shr    $0x3,%rcx
    3440:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3447:	0f b6 09             	movzbl (%rcx),%ecx
    344a:	84 c9                	test   %cl,%cl
    344c:	41 0f 95 c0          	setne  %r8b
    3450:	48 89 d6             	mov    %rdx,%rsi
    3453:	83 e6 07             	and    $0x7,%esi
    3456:	83 c6 03             	add    $0x3,%esi
    3459:	40 38 ce             	cmp    %cl,%sil
    345c:	0f 9d c1             	setge  %cl
    345f:	44 21 c1             	and    %r8d,%ecx
    3462:	84 c9                	test   %cl,%cl
    3464:	74 08                	je     346e <create+0x168>
    3466:	48 89 d7             	mov    %rdx,%rdi
    3469:	e8 c2 fb ff ff       	call   3030 <__asan_report_store4@plt>
    346e:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%rax)
    3475:	48 8d 50 10          	lea    0x10(%rax),%rdx
    3479:	48 89 d1             	mov    %rdx,%rcx
    347c:	48 c1 e9 03          	shr    $0x3,%rcx
    3480:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3487:	0f b6 09             	movzbl (%rcx),%ecx
    348a:	84 c9                	test   %cl,%cl
    348c:	74 08                	je     3496 <create+0x190>
    348e:	48 89 d7             	mov    %rdx,%rdi
    3491:	e8 3a fc ff ff       	call   30d0 <__asan_report_store8@plt>
    3496:	48 89 78 10          	mov    %rdi,0x10(%rax)
    349a:	48 8b 05 3f 7c 00 00 	mov    0x7c3f(%rip),%rax        # b0e0 <tptr>
    34a1:	48 8b 15 38 7c 00 00 	mov    0x7c38(%rip),%rdx        # b0e0 <tptr>
    34a8:	48 8d 7a 08          	lea    0x8(%rdx),%rdi
    34ac:	48 89 c1             	mov    %rax,%rcx
    34af:	48 8d 05 ce fd ff ff 	lea    -0x232(%rip),%rax        # 3284 <wrapper>
    34b6:	48 89 c2             	mov    %rax,%rdx
    34b9:	be 00 00 00 00       	mov    $0x0,%esi
    34be:	e8 ad fb ff ff       	call   3070 <pthread_create@plt>
    34c3:	48 8b 05 16 7c 00 00 	mov    0x7c16(%rip),%rax        # b0e0 <tptr>
    34ca:	48 83 c0 18          	add    $0x18,%rax
    34ce:	48 89 05 0b 7c 00 00 	mov    %rax,0x7c0b(%rip)        # b0e0 <tptr>
    34d5:	90                   	nop
    34d6:	c9                   	leave
    34d7:	c3                   	ret

00000000000034d8 <join>:
    34d8:	55                   	push   %rbp
    34d9:	48 89 e5             	mov    %rsp,%rbp
    34dc:	48 83 ec 10          	sub    $0x10,%rsp
    34e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    34e7:	e9 f0 00 00 00       	jmp    35dc <join+0x104>
    34ec:	8b 45 f4             	mov    -0xc(%rbp),%eax
    34ef:	48 63 d0             	movslq %eax,%rdx
    34f2:	48 89 d0             	mov    %rdx,%rax
    34f5:	48 01 c0             	add    %rax,%rax
    34f8:	48 01 d0             	add    %rdx,%rax
    34fb:	48 c1 e0 03          	shl    $0x3,%rax
    34ff:	48 8d 15 fa 95 00 00 	lea    0x95fa(%rip),%rdx        # cb00 <tpool>
    3506:	48 01 d0             	add    %rdx,%rax
    3509:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    350d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3511:	48 83 c0 04          	add    $0x4,%rax
    3515:	48 89 c2             	mov    %rax,%rdx
    3518:	48 c1 ea 03          	shr    $0x3,%rdx
    351c:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3523:	0f b6 12             	movzbl (%rdx),%edx
    3526:	84 d2                	test   %dl,%dl
    3528:	40 0f 95 c6          	setne  %sil
    352c:	48 89 c1             	mov    %rax,%rcx
    352f:	83 e1 07             	and    $0x7,%ecx
    3532:	83 c1 03             	add    $0x3,%ecx
    3535:	38 d1                	cmp    %dl,%cl
    3537:	0f 9d c2             	setge  %dl
    353a:	21 f2                	and    %esi,%edx
    353c:	84 d2                	test   %dl,%dl
    353e:	74 08                	je     3548 <join+0x70>
    3540:	48 89 c7             	mov    %rax,%rdi
    3543:	e8 48 fb ff ff       	call   3090 <__asan_report_load4@plt>
    3548:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    354c:	8b 40 04             	mov    0x4(%rax),%eax
    354f:	83 f8 01             	cmp    $0x1,%eax
    3552:	0f 85 80 00 00 00    	jne    35d8 <join+0x100>
    3558:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    355c:	48 83 c0 08          	add    $0x8,%rax
    3560:	48 89 c2             	mov    %rax,%rdx
    3563:	48 c1 ea 03          	shr    $0x3,%rdx
    3567:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    356e:	0f b6 12             	movzbl (%rdx),%edx
    3571:	84 d2                	test   %dl,%dl
    3573:	74 08                	je     357d <join+0xa5>
    3575:	48 89 c7             	mov    %rax,%rdi
    3578:	e8 c3 fb ff ff       	call   3140 <__asan_report_load8@plt>
    357d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3581:	48 8b 40 08          	mov    0x8(%rax),%rax
    3585:	be 00 00 00 00       	mov    $0x0,%esi
    358a:	48 89 c7             	mov    %rax,%rdi
    358d:	e8 ce fb ff ff       	call   3160 <pthread_join@plt>
    3592:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3596:	48 83 c0 04          	add    $0x4,%rax
    359a:	48 89 c2             	mov    %rax,%rdx
    359d:	48 c1 ea 03          	shr    $0x3,%rdx
    35a1:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    35a8:	0f b6 12             	movzbl (%rdx),%edx
    35ab:	84 d2                	test   %dl,%dl
    35ad:	40 0f 95 c6          	setne  %sil
    35b1:	48 89 c1             	mov    %rax,%rcx
    35b4:	83 e1 07             	and    $0x7,%ecx
    35b7:	83 c1 03             	add    $0x3,%ecx
    35ba:	38 d1                	cmp    %dl,%cl
    35bc:	0f 9d c2             	setge  %dl
    35bf:	21 f2                	and    %esi,%edx
    35c1:	84 d2                	test   %dl,%dl
    35c3:	74 08                	je     35cd <join+0xf5>
    35c5:	48 89 c7             	mov    %rax,%rdi
    35c8:	e8 63 fa ff ff       	call   3030 <__asan_report_store4@plt>
    35cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    35d1:	c7 40 04 02 00 00 00 	movl   $0x2,0x4(%rax)
    35d8:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    35dc:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%rbp)
    35e0:	0f 8e 06 ff ff ff    	jle    34ec <join+0x14>
    35e6:	90                   	nop
    35e7:	90                   	nop
    35e8:	c9                   	leave
    35e9:	c3                   	ret

00000000000035ea <cleanup>:
    35ea:	55                   	push   %rbp
    35eb:	48 89 e5             	mov    %rsp,%rbp
    35ee:	b8 00 00 00 00       	mov    $0x0,%eax
    35f3:	e8 e0 fe ff ff       	call   34d8 <join>
    35f8:	90                   	nop
    35f9:	5d                   	pop    %rbp
    35fa:	c3                   	ret

00000000000035fb <atomic_xchg>:
    35fb:	55                   	push   %rbp
    35fc:	48 89 e5             	mov    %rsp,%rbp
    35ff:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    3603:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    3606:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    360a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    360d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    3611:	f0 87 02             	lock xchg %eax,(%rdx)
    3614:	89 45 fc             	mov    %eax,-0x4(%rbp)
    3617:	8b 45 fc             	mov    -0x4(%rbp),%eax
    361a:	5d                   	pop    %rbp
    361b:	c3                   	ret

000000000000361c <spin_lock>:
    361c:	55                   	push   %rbp
    361d:	48 89 e5             	mov    %rsp,%rbp
    3620:	48 83 ec 18          	sub    $0x18,%rsp
    3624:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    3628:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    362c:	be 01 00 00 00       	mov    $0x1,%esi
    3631:	48 89 c7             	mov    %rax,%rdi
    3634:	e8 c2 ff ff ff       	call   35fb <atomic_xchg>
    3639:	48 98                	cltq
    363b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    363f:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    3644:	74 02                	je     3648 <spin_lock+0x2c>
    3646:	eb e0                	jmp    3628 <spin_lock+0xc>
    3648:	90                   	nop
    3649:	90                   	nop
    364a:	c9                   	leave
    364b:	c3                   	ret

000000000000364c <spin_unlock>:
    364c:	55                   	push   %rbp
    364d:	48 89 e5             	mov    %rsp,%rbp
    3650:	48 83 ec 08          	sub    $0x8,%rsp
    3654:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    3658:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    365c:	be 00 00 00 00       	mov    $0x0,%esi
    3661:	48 89 c7             	mov    %rax,%rdi
    3664:	e8 92 ff ff ff       	call   35fb <atomic_xchg>
    3669:	90                   	nop
    366a:	c9                   	leave
    366b:	c3                   	ret

000000000000366c <init_buddy>:
    366c:	55                   	push   %rbp
    366d:	48 89 e5             	mov    %rsp,%rbp
    3670:	41 54                	push   %r12
    3672:	53                   	push   %rbx
    3673:	48 83 ec 10          	sub    $0x10,%rsp
    3677:	48 8b 05 a2 9a 00 00 	mov    0x9aa2(%rip),%rax        # d120 <heap>
    367e:	48 89 05 db 9a 00 00 	mov    %rax,0x9adb(%rip)        # d160 <table>
    3685:	48 8d 05 94 9a 00 00 	lea    0x9a94(%rip),%rax        # d120 <heap>
    368c:	48 89 c6             	mov    %rax,%rsi
    368f:	48 8d 05 0a 4a 00 00 	lea    0x4a0a(%rip),%rax        # 80a0 <_IO_stdin_used+0xa0>
    3696:	48 89 c7             	mov    %rax,%rdi
    3699:	b8 00 00 00 00       	mov    $0x0,%eax
    369e:	e8 9d f9 ff ff       	call   3040 <printf@plt>
    36a3:	48 8b 15 7e 9a 00 00 	mov    0x9a7e(%rip),%rdx        # d128 <heap+0x8>
    36aa:	48 8b 05 6f 9a 00 00 	mov    0x9a6f(%rip),%rax        # d120 <heap>
    36b1:	48 29 c2             	sub    %rax,%rdx
    36b4:	48 89 d0             	mov    %rdx,%rax
    36b7:	48 8d 90 ff 0f 00 00 	lea    0xfff(%rax),%rdx
    36be:	48 85 c0             	test   %rax,%rax
    36c1:	48 0f 48 c2          	cmovs  %rdx,%rax
    36c5:	48 c1 f8 0c          	sar    $0xc,%rax
    36c9:	48 89 c2             	mov    %rax,%rdx
    36cc:	48 8b 05 8d 9a 00 00 	mov    0x9a8d(%rip),%rax        # d160 <table>
    36d3:	48 01 d0             	add    %rdx,%rax
    36d6:	48 05 ff ff ff 00    	add    $0xffffff,%rax
    36dc:	48 25 00 00 00 ff    	and    $0xffffffffff000000,%rax
    36e2:	48 89 05 b7 9a 00 00 	mov    %rax,0x9ab7(%rip)        # d1a0 <buddy_start>
    36e9:	48 8b 15 b0 9a 00 00 	mov    0x9ab0(%rip),%rdx        # d1a0 <buddy_start>
    36f0:	48 8b 05 29 9a 00 00 	mov    0x9a29(%rip),%rax        # d120 <heap>
    36f7:	48 29 c2             	sub    %rax,%rdx
    36fa:	48 89 d0             	mov    %rdx,%rax
    36fd:	48 8d 90 ff 0f 00 00 	lea    0xfff(%rax),%rdx
    3704:	48 85 c0             	test   %rax,%rax
    3707:	48 0f 48 c2          	cmovs  %rdx,%rax
    370b:	48 c1 f8 0c          	sar    $0xc,%rax
    370f:	89 45 ec             	mov    %eax,-0x14(%rbp)
    3712:	ba 00 03 00 00       	mov    $0x300,%edx
    3717:	be 00 00 00 00       	mov    $0x0,%esi
    371c:	48 8d 05 bd 9a 00 00 	lea    0x9abd(%rip),%rax        # d1e0 <buddy>
    3723:	48 89 c7             	mov    %rax,%rdi
    3726:	e8 85 f9 ff ff       	call   30b0 <memset@plt>
    372b:	8b 45 ec             	mov    -0x14(%rbp),%eax
    372e:	89 45 e8             	mov    %eax,-0x18(%rbp)
    3731:	e9 37 01 00 00       	jmp    386d <init_buddy+0x201>
    3736:	48 8b 0d 23 9a 00 00 	mov    0x9a23(%rip),%rcx        # d160 <table>
    373d:	8b 45 e8             	mov    -0x18(%rbp),%eax
    3740:	48 63 d0             	movslq %eax,%rdx
    3743:	48 89 d0             	mov    %rdx,%rax
    3746:	48 01 c0             	add    %rax,%rax
    3749:	48 01 d0             	add    %rdx,%rax
    374c:	48 c1 e0 03          	shl    $0x3,%rax
    3750:	48 01 c8             	add    %rcx,%rax
    3753:	48 8d 50 10          	lea    0x10(%rax),%rdx
    3757:	48 89 d1             	mov    %rdx,%rcx
    375a:	48 89 ca             	mov    %rcx,%rdx
    375d:	48 c1 ea 03          	shr    $0x3,%rdx
    3761:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3768:	0f b6 12             	movzbl (%rdx),%edx
    376b:	84 d2                	test   %dl,%dl
    376d:	40 0f 95 c6          	setne  %sil
    3771:	84 d2                	test   %dl,%dl
    3773:	0f 9e c2             	setle  %dl
    3776:	21 f2                	and    %esi,%edx
    3778:	84 d2                	test   %dl,%dl
    377a:	74 08                	je     3784 <init_buddy+0x118>
    377c:	48 89 cf             	mov    %rcx,%rdi
    377f:	e8 ac f9 ff ff       	call   3130 <__asan_report_store1@plt>
    3784:	0f b6 50 10          	movzbl 0x10(%rax),%edx
    3788:	83 e2 e0             	and    $0xffffffe0,%edx
    378b:	83 ca 18             	or     $0x18,%edx
    378e:	88 50 10             	mov    %dl,0x10(%rax)
    3791:	48 8b 0d c8 99 00 00 	mov    0x99c8(%rip),%rcx        # d160 <table>
    3798:	8b 45 e8             	mov    -0x18(%rbp),%eax
    379b:	48 63 d0             	movslq %eax,%rdx
    379e:	48 89 d0             	mov    %rdx,%rax
    37a1:	48 01 c0             	add    %rax,%rax
    37a4:	48 01 d0             	add    %rdx,%rax
    37a7:	48 c1 e0 03          	shl    $0x3,%rax
    37ab:	48 01 c8             	add    %rcx,%rax
    37ae:	48 8d 50 10          	lea    0x10(%rax),%rdx
    37b2:	48 89 d1             	mov    %rdx,%rcx
    37b5:	48 89 ca             	mov    %rcx,%rdx
    37b8:	48 c1 ea 03          	shr    $0x3,%rdx
    37bc:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    37c3:	0f b6 12             	movzbl (%rdx),%edx
    37c6:	84 d2                	test   %dl,%dl
    37c8:	40 0f 95 c6          	setne  %sil
    37cc:	84 d2                	test   %dl,%dl
    37ce:	0f 9e c2             	setle  %dl
    37d1:	21 f2                	and    %esi,%edx
    37d3:	84 d2                	test   %dl,%dl
    37d5:	74 08                	je     37df <init_buddy+0x173>
    37d7:	48 89 cf             	mov    %rcx,%rdi
    37da:	e8 51 f9 ff ff       	call   3130 <__asan_report_store1@plt>
    37df:	0f b6 50 10          	movzbl 0x10(%rax),%edx
    37e3:	83 e2 df             	and    $0xffffffdf,%edx
    37e6:	88 50 10             	mov    %dl,0x10(%rax)
    37e9:	48 8b 0d 70 99 00 00 	mov    0x9970(%rip),%rcx        # d160 <table>
    37f0:	8b 45 e8             	mov    -0x18(%rbp),%eax
    37f3:	48 63 d0             	movslq %eax,%rdx
    37f6:	48 89 d0             	mov    %rdx,%rax
    37f9:	48 01 c0             	add    %rax,%rax
    37fc:	48 01 d0             	add    %rdx,%rax
    37ff:	48 c1 e0 03          	shl    $0x3,%rax
    3803:	48 01 c8             	add    %rcx,%rax
    3806:	48 8d 50 10          	lea    0x10(%rax),%rdx
    380a:	48 89 d1             	mov    %rdx,%rcx
    380d:	48 89 ca             	mov    %rcx,%rdx
    3810:	48 c1 ea 03          	shr    $0x3,%rdx
    3814:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    381b:	0f b6 12             	movzbl (%rdx),%edx
    381e:	84 d2                	test   %dl,%dl
    3820:	40 0f 95 c6          	setne  %sil
    3824:	84 d2                	test   %dl,%dl
    3826:	0f 9e c2             	setle  %dl
    3829:	21 f2                	and    %esi,%edx
    382b:	84 d2                	test   %dl,%dl
    382d:	74 08                	je     3837 <init_buddy+0x1cb>
    382f:	48 89 cf             	mov    %rcx,%rdi
    3832:	e8 f9 f8 ff ff       	call   3130 <__asan_report_store1@plt>
    3837:	0f b6 50 10          	movzbl 0x10(%rax),%edx
    383b:	83 e2 bf             	and    $0xffffffbf,%edx
    383e:	88 50 10             	mov    %dl,0x10(%rax)
    3841:	48 8b 0d 18 99 00 00 	mov    0x9918(%rip),%rcx        # d160 <table>
    3848:	8b 45 e8             	mov    -0x18(%rbp),%eax
    384b:	48 63 d0             	movslq %eax,%rdx
    384e:	48 89 d0             	mov    %rdx,%rax
    3851:	48 01 c0             	add    %rax,%rax
    3854:	48 01 d0             	add    %rdx,%rax
    3857:	48 c1 e0 03          	shl    $0x3,%rax
    385b:	48 01 c8             	add    %rcx,%rax
    385e:	48 89 c7             	mov    %rax,%rdi
    3861:	e8 89 00 00 00       	call   38ef <buddy_insert>
    3866:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%rbp)
    386d:	8b 45 e8             	mov    -0x18(%rbp),%eax
    3870:	48 63 d0             	movslq %eax,%rdx
    3873:	48 8b 0d ae 98 00 00 	mov    0x98ae(%rip),%rcx        # d128 <heap+0x8>
    387a:	48 8b 05 9f 98 00 00 	mov    0x989f(%rip),%rax        # d120 <heap>
    3881:	48 29 c1             	sub    %rax,%rcx
    3884:	48 89 c8             	mov    %rcx,%rax
    3887:	48 8d 88 ff 0f 00 00 	lea    0xfff(%rax),%rcx
    388e:	48 85 c0             	test   %rax,%rax
    3891:	48 0f 48 c1          	cmovs  %rcx,%rax
    3895:	48 c1 f8 0c          	sar    $0xc,%rax
    3899:	48 39 c2             	cmp    %rax,%rdx
    389c:	0f 8c 94 fe ff ff    	jl     3736 <init_buddy+0xca>
    38a2:	4c 8b 25 7f 98 00 00 	mov    0x987f(%rip),%r12        # d128 <heap+0x8>
    38a9:	48 8b 1d f0 98 00 00 	mov    0x98f0(%rip),%rbx        # d1a0 <buddy_start>
    38b0:	b8 00 00 00 00       	mov    $0x0,%eax
    38b5:	e8 bf f9 ff ff       	call   3279 <cpu_current>
    38ba:	89 c6                	mov    %eax,%esi
    38bc:	4d 89 e1             	mov    %r12,%r9
    38bf:	49 89 d8             	mov    %rbx,%r8
    38c2:	b9 22 00 00 00       	mov    $0x22,%ecx
    38c7:	48 8d 05 72 4e 00 00 	lea    0x4e72(%rip),%rax        # 8740 <__FUNCTION__.8>
    38ce:	48 89 c2             	mov    %rax,%rdx
    38d1:	48 8d 05 08 48 00 00 	lea    0x4808(%rip),%rax        # 80e0 <_IO_stdin_used+0xe0>
    38d8:	48 89 c7             	mov    %rax,%rdi
    38db:	b8 00 00 00 00       	mov    $0x0,%eax
    38e0:	e8 5b f7 ff ff       	call   3040 <printf@plt>
    38e5:	90                   	nop
    38e6:	48 83 c4 10          	add    $0x10,%rsp
    38ea:	5b                   	pop    %rbx
    38eb:	41 5c                	pop    %r12
    38ed:	5d                   	pop    %rbp
    38ee:	c3                   	ret

00000000000038ef <buddy_insert>:
    38ef:	55                   	push   %rbp
    38f0:	48 89 e5             	mov    %rsp,%rbp
    38f3:	53                   	push   %rbx
    38f4:	48 83 ec 28          	sub    $0x28,%rsp
    38f8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    38fc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3900:	48 83 c0 10          	add    $0x10,%rax
    3904:	48 89 c2             	mov    %rax,%rdx
    3907:	48 89 d0             	mov    %rdx,%rax
    390a:	48 c1 e8 03          	shr    $0x3,%rax
    390e:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    3914:	0f b6 00             	movzbl (%rax),%eax
    3917:	84 c0                	test   %al,%al
    3919:	0f 95 c1             	setne  %cl
    391c:	84 c0                	test   %al,%al
    391e:	0f 9e c0             	setle  %al
    3921:	21 c8                	and    %ecx,%eax
    3923:	84 c0                	test   %al,%al
    3925:	74 08                	je     392f <buddy_insert+0x40>
    3927:	48 89 d7             	mov    %rdx,%rdi
    392a:	e8 f1 f7 ff ff       	call   3120 <__asan_report_load1@plt>
    392f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3933:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    3937:	83 e0 1f             	and    $0x1f,%eax
    393a:	0f b6 c0             	movzbl %al,%eax
    393d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    3940:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    3943:	48 63 d0             	movslq %eax,%rdx
    3946:	48 89 d0             	mov    %rdx,%rax
    3949:	48 01 c0             	add    %rax,%rax
    394c:	48 01 d0             	add    %rdx,%rax
    394f:	48 c1 e0 03          	shl    $0x3,%rax
    3953:	48 8d 15 86 98 00 00 	lea    0x9886(%rip),%rdx        # d1e0 <buddy>
    395a:	48 01 d0             	add    %rdx,%rax
    395d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    3961:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3965:	48 83 c0 08          	add    $0x8,%rax
    3969:	48 89 c2             	mov    %rax,%rdx
    396c:	48 c1 ea 03          	shr    $0x3,%rdx
    3970:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3977:	0f b6 12             	movzbl (%rdx),%edx
    397a:	84 d2                	test   %dl,%dl
    397c:	74 08                	je     3986 <buddy_insert+0x97>
    397e:	48 89 c7             	mov    %rax,%rdi
    3981:	e8 ba f7 ff ff       	call   3140 <__asan_report_load8@plt>
    3986:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    398a:	48 8b 40 08          	mov    0x8(%rax),%rax
    398e:	48 85 c0             	test   %rax,%rax
    3991:	0f 85 a7 00 00 00    	jne    3a3e <buddy_insert+0x14f>
    3997:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    399b:	48 83 c0 10          	add    $0x10,%rax
    399f:	48 89 c2             	mov    %rax,%rdx
    39a2:	48 c1 ea 03          	shr    $0x3,%rdx
    39a6:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    39ad:	0f b6 12             	movzbl (%rdx),%edx
    39b0:	84 d2                	test   %dl,%dl
    39b2:	74 08                	je     39bc <buddy_insert+0xcd>
    39b4:	48 89 c7             	mov    %rax,%rdi
    39b7:	e8 14 f7 ff ff       	call   30d0 <__asan_report_store8@plt>
    39bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    39c0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    39c4:	48 89 50 10          	mov    %rdx,0x10(%rax)
    39c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    39cc:	48 8b 50 10          	mov    0x10(%rax),%rdx
    39d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    39d4:	48 89 50 08          	mov    %rdx,0x8(%rax)
    39d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    39dc:	48 83 c0 08          	add    $0x8,%rax
    39e0:	48 89 c2             	mov    %rax,%rdx
    39e3:	48 c1 ea 03          	shr    $0x3,%rdx
    39e7:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    39ee:	0f b6 12             	movzbl (%rdx),%edx
    39f1:	84 d2                	test   %dl,%dl
    39f3:	74 08                	je     39fd <buddy_insert+0x10e>
    39f5:	48 89 c7             	mov    %rax,%rdi
    39f8:	e8 d3 f6 ff ff       	call   30d0 <__asan_report_store8@plt>
    39fd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3a01:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    3a08:	00 
    3a09:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3a0d:	48 8b 50 08          	mov    0x8(%rax),%rdx
    3a11:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3a15:	48 89 c1             	mov    %rax,%rcx
    3a18:	48 c1 e9 03          	shr    $0x3,%rcx
    3a1c:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3a23:	0f b6 09             	movzbl (%rcx),%ecx
    3a26:	84 c9                	test   %cl,%cl
    3a28:	74 08                	je     3a32 <buddy_insert+0x143>
    3a2a:	48 89 c7             	mov    %rax,%rdi
    3a2d:	e8 9e f6 ff ff       	call   30d0 <__asan_report_store8@plt>
    3a32:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3a36:	48 89 10             	mov    %rdx,(%rax)
    3a39:	e9 c3 00 00 00       	jmp    3b01 <buddy_insert+0x212>
    3a3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3a42:	48 83 c0 10          	add    $0x10,%rax
    3a46:	48 89 c2             	mov    %rax,%rdx
    3a49:	48 c1 ea 03          	shr    $0x3,%rdx
    3a4d:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3a54:	0f b6 12             	movzbl (%rdx),%edx
    3a57:	84 d2                	test   %dl,%dl
    3a59:	74 08                	je     3a63 <buddy_insert+0x174>
    3a5b:	48 89 c7             	mov    %rax,%rdi
    3a5e:	e8 dd f6 ff ff       	call   3140 <__asan_report_load8@plt>
    3a63:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3a67:	48 8b 40 10          	mov    0x10(%rax),%rax
    3a6b:	48 8d 50 08          	lea    0x8(%rax),%rdx
    3a6f:	48 89 d1             	mov    %rdx,%rcx
    3a72:	48 c1 e9 03          	shr    $0x3,%rcx
    3a76:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3a7d:	0f b6 09             	movzbl (%rcx),%ecx
    3a80:	84 c9                	test   %cl,%cl
    3a82:	74 08                	je     3a8c <buddy_insert+0x19d>
    3a84:	48 89 d7             	mov    %rdx,%rdi
    3a87:	e8 44 f6 ff ff       	call   30d0 <__asan_report_store8@plt>
    3a8c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    3a90:	48 89 50 08          	mov    %rdx,0x8(%rax)
    3a94:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3a98:	48 8b 50 10          	mov    0x10(%rax),%rdx
    3a9c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3aa0:	48 89 c1             	mov    %rax,%rcx
    3aa3:	48 c1 e9 03          	shr    $0x3,%rcx
    3aa7:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3aae:	0f b6 09             	movzbl (%rcx),%ecx
    3ab1:	84 c9                	test   %cl,%cl
    3ab3:	74 08                	je     3abd <buddy_insert+0x1ce>
    3ab5:	48 89 c7             	mov    %rax,%rdi
    3ab8:	e8 13 f6 ff ff       	call   30d0 <__asan_report_store8@plt>
    3abd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3ac1:	48 89 10             	mov    %rdx,(%rax)
    3ac4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3ac8:	48 83 c0 08          	add    $0x8,%rax
    3acc:	48 89 c2             	mov    %rax,%rdx
    3acf:	48 c1 ea 03          	shr    $0x3,%rdx
    3ad3:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3ada:	0f b6 12             	movzbl (%rdx),%edx
    3add:	84 d2                	test   %dl,%dl
    3adf:	74 08                	je     3ae9 <buddy_insert+0x1fa>
    3ae1:	48 89 c7             	mov    %rax,%rdi
    3ae4:	e8 e7 f5 ff ff       	call   30d0 <__asan_report_store8@plt>
    3ae9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3aed:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    3af4:	00 
    3af5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3af9:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    3afd:	48 89 50 10          	mov    %rdx,0x10(%rax)
    3b01:	48 8b 15 18 96 00 00 	mov    0x9618(%rip),%rdx        # d120 <heap>
    3b08:	48 8b 05 51 96 00 00 	mov    0x9651(%rip),%rax        # d160 <table>
    3b0f:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    3b13:	48 29 c1             	sub    %rax,%rcx
    3b16:	48 c1 f9 03          	sar    $0x3,%rcx
    3b1a:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    3b21:	aa aa aa 
    3b24:	48 0f af c1          	imul   %rcx,%rax
    3b28:	48 c1 e0 0c          	shl    $0xc,%rax
    3b2c:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
    3b30:	b8 00 00 00 00       	mov    $0x0,%eax
    3b35:	e8 3f f7 ff ff       	call   3279 <cpu_current>
    3b3a:	89 c6                	mov    %eax,%esi
    3b3c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    3b3f:	41 89 c1             	mov    %eax,%r9d
    3b42:	49 89 d8             	mov    %rbx,%r8
    3b45:	b9 33 00 00 00       	mov    $0x33,%ecx
    3b4a:	48 8d 05 2f 4c 00 00 	lea    0x4c2f(%rip),%rax        # 8780 <__FUNCTION__.7>
    3b51:	48 89 c2             	mov    %rax,%rdx
    3b54:	48 8d 05 05 46 00 00 	lea    0x4605(%rip),%rax        # 8160 <_IO_stdin_used+0x160>
    3b5b:	48 89 c7             	mov    %rax,%rdi
    3b5e:	b8 00 00 00 00       	mov    $0x0,%eax
    3b63:	e8 d8 f4 ff ff       	call   3040 <printf@plt>
    3b68:	90                   	nop
    3b69:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
    3b6d:	c9                   	leave
    3b6e:	c3                   	ret

0000000000003b6f <buddy_delete>:
    3b6f:	55                   	push   %rbp
    3b70:	48 89 e5             	mov    %rsp,%rbp
    3b73:	41 54                	push   %r12
    3b75:	53                   	push   %rbx
    3b76:	48 83 ec 20          	sub    $0x20,%rsp
    3b7a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    3b7e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3b82:	48 83 c0 10          	add    $0x10,%rax
    3b86:	48 89 c2             	mov    %rax,%rdx
    3b89:	48 89 d0             	mov    %rdx,%rax
    3b8c:	48 c1 e8 03          	shr    $0x3,%rax
    3b90:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    3b96:	0f b6 00             	movzbl (%rax),%eax
    3b99:	84 c0                	test   %al,%al
    3b9b:	0f 95 c1             	setne  %cl
    3b9e:	84 c0                	test   %al,%al
    3ba0:	0f 9e c0             	setle  %al
    3ba3:	21 c8                	and    %ecx,%eax
    3ba5:	84 c0                	test   %al,%al
    3ba7:	74 08                	je     3bb1 <buddy_delete+0x42>
    3ba9:	48 89 d7             	mov    %rdx,%rdi
    3bac:	e8 6f f5 ff ff       	call   3120 <__asan_report_load1@plt>
    3bb1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3bb5:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    3bb9:	83 e0 1f             	and    $0x1f,%eax
    3bbc:	0f b6 c0             	movzbl %al,%eax
    3bbf:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    3bc2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    3bc5:	48 63 d0             	movslq %eax,%rdx
    3bc8:	48 89 d0             	mov    %rdx,%rax
    3bcb:	48 01 c0             	add    %rax,%rax
    3bce:	48 01 d0             	add    %rdx,%rax
    3bd1:	48 c1 e0 03          	shl    $0x3,%rax
    3bd5:	48 8d 15 04 96 00 00 	lea    0x9604(%rip),%rdx        # d1e0 <buddy>
    3bdc:	48 01 d0             	add    %rdx,%rax
    3bdf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    3be3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3be7:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    3beb:	83 e0 1f             	and    $0x1f,%eax
    3bee:	0f b6 c0             	movzbl %al,%eax
    3bf1:	ba 01 00 00 00       	mov    $0x1,%edx
    3bf6:	89 c1                	mov    %eax,%ecx
    3bf8:	d3 e2                	shl    %cl,%edx
    3bfa:	41 89 d4             	mov    %edx,%r12d
    3bfd:	48 8b 15 1c 95 00 00 	mov    0x951c(%rip),%rdx        # d120 <heap>
    3c04:	48 8b 05 55 95 00 00 	mov    0x9555(%rip),%rax        # d160 <table>
    3c0b:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    3c0f:	48 29 c1             	sub    %rax,%rcx
    3c12:	48 c1 f9 03          	sar    $0x3,%rcx
    3c16:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    3c1d:	aa aa aa 
    3c20:	48 0f af c1          	imul   %rcx,%rax
    3c24:	48 c1 e0 0c          	shl    $0xc,%rax
    3c28:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
    3c2c:	b8 00 00 00 00       	mov    $0x0,%eax
    3c31:	e8 43 f6 ff ff       	call   3279 <cpu_current>
    3c36:	89 c6                	mov    %eax,%esi
    3c38:	45 89 e1             	mov    %r12d,%r9d
    3c3b:	49 89 d8             	mov    %rbx,%r8
    3c3e:	b9 3a 00 00 00       	mov    $0x3a,%ecx
    3c43:	48 8d 05 76 4b 00 00 	lea    0x4b76(%rip),%rax        # 87c0 <__FUNCTION__.6>
    3c4a:	48 89 c2             	mov    %rax,%rdx
    3c4d:	48 8d 05 8c 45 00 00 	lea    0x458c(%rip),%rax        # 81e0 <_IO_stdin_used+0x1e0>
    3c54:	48 89 c7             	mov    %rax,%rdi
    3c57:	b8 00 00 00 00       	mov    $0x0,%eax
    3c5c:	e8 df f3 ff ff       	call   3040 <printf@plt>
    3c61:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3c65:	48 83 c0 08          	add    $0x8,%rax
    3c69:	48 89 c2             	mov    %rax,%rdx
    3c6c:	48 c1 ea 03          	shr    $0x3,%rdx
    3c70:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3c77:	0f b6 12             	movzbl (%rdx),%edx
    3c7a:	84 d2                	test   %dl,%dl
    3c7c:	74 08                	je     3c86 <buddy_delete+0x117>
    3c7e:	48 89 c7             	mov    %rax,%rdi
    3c81:	e8 ba f4 ff ff       	call   3140 <__asan_report_load8@plt>
    3c86:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3c8a:	48 8b 40 08          	mov    0x8(%rax),%rax
    3c8e:	48 85 c0             	test   %rax,%rax
    3c91:	74 32                	je     3cc5 <buddy_delete+0x156>
    3c93:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3c97:	48 83 c0 10          	add    $0x10,%rax
    3c9b:	48 89 c2             	mov    %rax,%rdx
    3c9e:	48 c1 ea 03          	shr    $0x3,%rdx
    3ca2:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3ca9:	0f b6 12             	movzbl (%rdx),%edx
    3cac:	84 d2                	test   %dl,%dl
    3cae:	74 08                	je     3cb8 <buddy_delete+0x149>
    3cb0:	48 89 c7             	mov    %rax,%rdi
    3cb3:	e8 88 f4 ff ff       	call   3140 <__asan_report_load8@plt>
    3cb8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3cbc:	48 8b 40 10          	mov    0x10(%rax),%rax
    3cc0:	48 85 c0             	test   %rax,%rax
    3cc3:	75 2d                	jne    3cf2 <buddy_delete+0x183>
    3cc5:	e8 26 f4 ff ff       	call   30f0 <__asan_handle_no_return@plt>
    3cca:	48 8d 05 2f 4b 00 00 	lea    0x4b2f(%rip),%rax        # 8800 <__PRETTY_FUNCTION__.5>
    3cd1:	48 89 c1             	mov    %rax,%rcx
    3cd4:	ba 3b 00 00 00       	mov    $0x3b,%edx
    3cd9:	48 8d 05 60 45 00 00 	lea    0x4560(%rip),%rax        # 8240 <_IO_stdin_used+0x240>
    3ce0:	48 89 c6             	mov    %rax,%rsi
    3ce3:	48 8d 05 96 45 00 00 	lea    0x4596(%rip),%rax        # 8280 <_IO_stdin_used+0x280>
    3cea:	48 89 c7             	mov    %rax,%rdi
    3ced:	e8 ae f3 ff ff       	call   30a0 <__assert_fail@plt>
    3cf2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3cf6:	48 83 c0 08          	add    $0x8,%rax
    3cfa:	48 89 c2             	mov    %rax,%rdx
    3cfd:	48 c1 ea 03          	shr    $0x3,%rdx
    3d01:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3d08:	0f b6 12             	movzbl (%rdx),%edx
    3d0b:	84 d2                	test   %dl,%dl
    3d0d:	74 08                	je     3d17 <buddy_delete+0x1a8>
    3d0f:	48 89 c7             	mov    %rax,%rdi
    3d12:	e8 29 f4 ff ff       	call   3140 <__asan_report_load8@plt>
    3d17:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3d1b:	48 8b 48 08          	mov    0x8(%rax),%rcx
    3d1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3d23:	48 83 c0 10          	add    $0x10,%rax
    3d27:	48 89 c2             	mov    %rax,%rdx
    3d2a:	48 c1 ea 03          	shr    $0x3,%rdx
    3d2e:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3d35:	0f b6 12             	movzbl (%rdx),%edx
    3d38:	84 d2                	test   %dl,%dl
    3d3a:	74 08                	je     3d44 <buddy_delete+0x1d5>
    3d3c:	48 89 c7             	mov    %rax,%rdi
    3d3f:	e8 fc f3 ff ff       	call   3140 <__asan_report_load8@plt>
    3d44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3d48:	48 8b 40 10          	mov    0x10(%rax),%rax
    3d4c:	48 39 c1             	cmp    %rax,%rcx
    3d4f:	0f 85 a6 00 00 00    	jne    3dfb <buddy_delete+0x28c>
    3d55:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3d59:	48 8b 40 08          	mov    0x8(%rax),%rax
    3d5d:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
    3d61:	74 2d                	je     3d90 <buddy_delete+0x221>
    3d63:	e8 88 f3 ff ff       	call   30f0 <__asan_handle_no_return@plt>
    3d68:	48 8d 05 91 4a 00 00 	lea    0x4a91(%rip),%rax        # 8800 <__PRETTY_FUNCTION__.5>
    3d6f:	48 89 c1             	mov    %rax,%rcx
    3d72:	ba 3d 00 00 00       	mov    $0x3d,%edx
    3d77:	48 8d 05 c2 44 00 00 	lea    0x44c2(%rip),%rax        # 8240 <_IO_stdin_used+0x240>
    3d7e:	48 89 c6             	mov    %rax,%rsi
    3d81:	48 8d 05 38 45 00 00 	lea    0x4538(%rip),%rax        # 82c0 <_IO_stdin_used+0x2c0>
    3d88:	48 89 c7             	mov    %rax,%rdi
    3d8b:	e8 10 f3 ff ff       	call   30a0 <__assert_fail@plt>
    3d90:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3d94:	48 83 c0 10          	add    $0x10,%rax
    3d98:	48 89 c2             	mov    %rax,%rdx
    3d9b:	48 c1 ea 03          	shr    $0x3,%rdx
    3d9f:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3da6:	0f b6 12             	movzbl (%rdx),%edx
    3da9:	84 d2                	test   %dl,%dl
    3dab:	74 08                	je     3db5 <buddy_delete+0x246>
    3dad:	48 89 c7             	mov    %rax,%rdi
    3db0:	e8 1b f3 ff ff       	call   30d0 <__asan_report_store8@plt>
    3db5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3db9:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
    3dc0:	00 
    3dc1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3dc5:	48 8b 50 10          	mov    0x10(%rax),%rdx
    3dc9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3dcd:	48 83 c0 08          	add    $0x8,%rax
    3dd1:	48 89 c1             	mov    %rax,%rcx
    3dd4:	48 c1 e9 03          	shr    $0x3,%rcx
    3dd8:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3ddf:	0f b6 09             	movzbl (%rcx),%ecx
    3de2:	84 c9                	test   %cl,%cl
    3de4:	74 08                	je     3dee <buddy_delete+0x27f>
    3de6:	48 89 c7             	mov    %rax,%rdi
    3de9:	e8 e2 f2 ff ff       	call   30d0 <__asan_report_store8@plt>
    3dee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3df2:	48 89 50 08          	mov    %rdx,0x8(%rax)
    3df6:	e9 30 01 00 00       	jmp    3f2b <buddy_delete+0x3bc>
    3dfb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3dff:	48 83 c0 08          	add    $0x8,%rax
    3e03:	48 89 c2             	mov    %rax,%rdx
    3e06:	48 c1 ea 03          	shr    $0x3,%rdx
    3e0a:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3e11:	0f b6 12             	movzbl (%rdx),%edx
    3e14:	84 d2                	test   %dl,%dl
    3e16:	74 08                	je     3e20 <buddy_delete+0x2b1>
    3e18:	48 89 c7             	mov    %rax,%rdi
    3e1b:	e8 20 f3 ff ff       	call   3140 <__asan_report_load8@plt>
    3e20:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3e24:	48 8b 40 08          	mov    0x8(%rax),%rax
    3e28:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
    3e2c:	75 69                	jne    3e97 <buddy_delete+0x328>
    3e2e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3e32:	48 83 c0 08          	add    $0x8,%rax
    3e36:	48 89 c2             	mov    %rax,%rdx
    3e39:	48 c1 ea 03          	shr    $0x3,%rdx
    3e3d:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3e44:	0f b6 12             	movzbl (%rdx),%edx
    3e47:	84 d2                	test   %dl,%dl
    3e49:	74 08                	je     3e53 <buddy_delete+0x2e4>
    3e4b:	48 89 c7             	mov    %rax,%rdi
    3e4e:	e8 ed f2 ff ff       	call   3140 <__asan_report_load8@plt>
    3e53:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3e57:	48 8b 50 08          	mov    0x8(%rax),%rdx
    3e5b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3e5f:	48 89 50 08          	mov    %rdx,0x8(%rax)
    3e63:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3e67:	48 8b 40 08          	mov    0x8(%rax),%rax
    3e6b:	48 89 c2             	mov    %rax,%rdx
    3e6e:	48 89 d1             	mov    %rdx,%rcx
    3e71:	48 c1 e9 03          	shr    $0x3,%rcx
    3e75:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3e7c:	0f b6 09             	movzbl (%rcx),%ecx
    3e7f:	84 c9                	test   %cl,%cl
    3e81:	74 08                	je     3e8b <buddy_delete+0x31c>
    3e83:	48 89 d7             	mov    %rdx,%rdi
    3e86:	e8 45 f2 ff ff       	call   30d0 <__asan_report_store8@plt>
    3e8b:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    3e92:	e9 94 00 00 00       	jmp    3f2b <buddy_delete+0x3bc>
    3e97:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3e9b:	48 83 c0 10          	add    $0x10,%rax
    3e9f:	48 89 c2             	mov    %rax,%rdx
    3ea2:	48 c1 ea 03          	shr    $0x3,%rdx
    3ea6:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3ead:	0f b6 12             	movzbl (%rdx),%edx
    3eb0:	84 d2                	test   %dl,%dl
    3eb2:	74 08                	je     3ebc <buddy_delete+0x34d>
    3eb4:	48 89 c7             	mov    %rax,%rdi
    3eb7:	e8 84 f2 ff ff       	call   3140 <__asan_report_load8@plt>
    3ebc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3ec0:	48 8b 40 10          	mov    0x10(%rax),%rax
    3ec4:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
    3ec8:	75 61                	jne    3f2b <buddy_delete+0x3bc>
    3eca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3ece:	48 89 c2             	mov    %rax,%rdx
    3ed1:	48 c1 ea 03          	shr    $0x3,%rdx
    3ed5:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3edc:	0f b6 12             	movzbl (%rdx),%edx
    3edf:	84 d2                	test   %dl,%dl
    3ee1:	74 08                	je     3eeb <buddy_delete+0x37c>
    3ee3:	48 89 c7             	mov    %rax,%rdi
    3ee6:	e8 55 f2 ff ff       	call   3140 <__asan_report_load8@plt>
    3eeb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3eef:	48 8b 10             	mov    (%rax),%rdx
    3ef2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3ef6:	48 89 50 10          	mov    %rdx,0x10(%rax)
    3efa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3efe:	48 8b 40 10          	mov    0x10(%rax),%rax
    3f02:	48 8d 50 08          	lea    0x8(%rax),%rdx
    3f06:	48 89 d1             	mov    %rdx,%rcx
    3f09:	48 c1 e9 03          	shr    $0x3,%rcx
    3f0d:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3f14:	0f b6 09             	movzbl (%rcx),%ecx
    3f17:	84 c9                	test   %cl,%cl
    3f19:	74 08                	je     3f23 <buddy_delete+0x3b4>
    3f1b:	48 89 d7             	mov    %rdx,%rdi
    3f1e:	e8 ad f1 ff ff       	call   30d0 <__asan_report_store8@plt>
    3f23:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    3f2a:	00 
    3f2b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3f2f:	48 89 c2             	mov    %rax,%rdx
    3f32:	48 c1 ea 03          	shr    $0x3,%rdx
    3f36:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3f3d:	0f b6 12             	movzbl (%rdx),%edx
    3f40:	84 d2                	test   %dl,%dl
    3f42:	74 08                	je     3f4c <buddy_delete+0x3dd>
    3f44:	48 89 c7             	mov    %rax,%rdi
    3f47:	e8 f4 f1 ff ff       	call   3140 <__asan_report_load8@plt>
    3f4c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3f50:	48 8b 00             	mov    (%rax),%rax
    3f53:	48 85 c0             	test   %rax,%rax
    3f56:	74 5a                	je     3fb2 <buddy_delete+0x443>
    3f58:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3f5c:	48 8b 00             	mov    (%rax),%rax
    3f5f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    3f63:	48 83 c2 08          	add    $0x8,%rdx
    3f67:	48 89 d1             	mov    %rdx,%rcx
    3f6a:	48 c1 e9 03          	shr    $0x3,%rcx
    3f6e:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3f75:	0f b6 09             	movzbl (%rcx),%ecx
    3f78:	84 c9                	test   %cl,%cl
    3f7a:	74 08                	je     3f84 <buddy_delete+0x415>
    3f7c:	48 89 d7             	mov    %rdx,%rdi
    3f7f:	e8 bc f1 ff ff       	call   3140 <__asan_report_load8@plt>
    3f84:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    3f88:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
    3f8c:	48 8d 50 08          	lea    0x8(%rax),%rdx
    3f90:	48 89 d6             	mov    %rdx,%rsi
    3f93:	48 c1 ee 03          	shr    $0x3,%rsi
    3f97:	48 81 c6 00 80 ff 7f 	add    $0x7fff8000,%rsi
    3f9e:	0f b6 36             	movzbl (%rsi),%esi
    3fa1:	40 84 f6             	test   %sil,%sil
    3fa4:	74 08                	je     3fae <buddy_delete+0x43f>
    3fa6:	48 89 d7             	mov    %rdx,%rdi
    3fa9:	e8 22 f1 ff ff       	call   30d0 <__asan_report_store8@plt>
    3fae:	48 89 48 08          	mov    %rcx,0x8(%rax)
    3fb2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3fb6:	48 83 c0 08          	add    $0x8,%rax
    3fba:	48 89 c2             	mov    %rax,%rdx
    3fbd:	48 c1 ea 03          	shr    $0x3,%rdx
    3fc1:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3fc8:	0f b6 12             	movzbl (%rdx),%edx
    3fcb:	84 d2                	test   %dl,%dl
    3fcd:	74 08                	je     3fd7 <buddy_delete+0x468>
    3fcf:	48 89 c7             	mov    %rax,%rdi
    3fd2:	e8 69 f1 ff ff       	call   3140 <__asan_report_load8@plt>
    3fd7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3fdb:	48 8b 40 08          	mov    0x8(%rax),%rax
    3fdf:	48 85 c0             	test   %rax,%rax
    3fe2:	74 54                	je     4038 <buddy_delete+0x4c9>
    3fe4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3fe8:	48 8b 40 08          	mov    0x8(%rax),%rax
    3fec:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    3ff0:	48 89 d1             	mov    %rdx,%rcx
    3ff3:	48 c1 e9 03          	shr    $0x3,%rcx
    3ff7:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3ffe:	0f b6 09             	movzbl (%rcx),%ecx
    4001:	84 c9                	test   %cl,%cl
    4003:	74 08                	je     400d <buddy_delete+0x49e>
    4005:	48 89 d7             	mov    %rdx,%rdi
    4008:	e8 33 f1 ff ff       	call   3140 <__asan_report_load8@plt>
    400d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    4011:	48 8b 0a             	mov    (%rdx),%rcx
    4014:	48 89 c2             	mov    %rax,%rdx
    4017:	48 89 d6             	mov    %rdx,%rsi
    401a:	48 c1 ee 03          	shr    $0x3,%rsi
    401e:	48 81 c6 00 80 ff 7f 	add    $0x7fff8000,%rsi
    4025:	0f b6 36             	movzbl (%rsi),%esi
    4028:	40 84 f6             	test   %sil,%sil
    402b:	74 08                	je     4035 <buddy_delete+0x4c6>
    402d:	48 89 d7             	mov    %rdx,%rdi
    4030:	e8 9b f0 ff ff       	call   30d0 <__asan_report_store8@plt>
    4035:	48 89 08             	mov    %rcx,(%rax)
    4038:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    403c:	48 83 c0 08          	add    $0x8,%rax
    4040:	48 89 c2             	mov    %rax,%rdx
    4043:	48 c1 ea 03          	shr    $0x3,%rdx
    4047:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    404e:	0f b6 12             	movzbl (%rdx),%edx
    4051:	84 d2                	test   %dl,%dl
    4053:	74 08                	je     405d <buddy_delete+0x4ee>
    4055:	48 89 c7             	mov    %rax,%rdi
    4058:	e8 73 f0 ff ff       	call   30d0 <__asan_report_store8@plt>
    405d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4061:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    4068:	00 
    4069:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    406d:	48 8b 50 08          	mov    0x8(%rax),%rdx
    4071:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4075:	48 89 c1             	mov    %rax,%rcx
    4078:	48 c1 e9 03          	shr    $0x3,%rcx
    407c:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    4083:	0f b6 09             	movzbl (%rcx),%ecx
    4086:	84 c9                	test   %cl,%cl
    4088:	74 08                	je     4092 <buddy_delete+0x523>
    408a:	48 89 c7             	mov    %rax,%rdi
    408d:	e8 3e f0 ff ff       	call   30d0 <__asan_report_store8@plt>
    4092:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4096:	48 89 10             	mov    %rdx,(%rax)
    4099:	90                   	nop
    409a:	48 83 c4 20          	add    $0x20,%rsp
    409e:	5b                   	pop    %rbx
    409f:	41 5c                	pop    %r12
    40a1:	5d                   	pop    %rbp
    40a2:	c3                   	ret

00000000000040a3 <buddy_fetch_best_chunk>:
    40a3:	55                   	push   %rbp
    40a4:	48 89 e5             	mov    %rsp,%rbp
    40a7:	53                   	push   %rbx
    40a8:	48 83 ec 28          	sub    $0x28,%rsp
    40ac:	89 7d dc             	mov    %edi,-0x24(%rbp)
    40af:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
    40b6:	00 
    40b7:	e9 f3 02 00 00       	jmp    43af <buddy_fetch_best_chunk+0x30c>
    40bc:	8b 45 dc             	mov    -0x24(%rbp),%eax
    40bf:	48 63 d0             	movslq %eax,%rdx
    40c2:	48 89 d0             	mov    %rdx,%rax
    40c5:	48 01 c0             	add    %rax,%rax
    40c8:	48 01 d0             	add    %rdx,%rax
    40cb:	48 c1 e0 03          	shl    $0x3,%rax
    40cf:	48 8d 15 0a 91 00 00 	lea    0x910a(%rip),%rdx        # d1e0 <buddy>
    40d6:	48 01 d0             	add    %rdx,%rax
    40d9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    40dd:	48 8d 05 fc 90 00 00 	lea    0x90fc(%rip),%rax        # d1e0 <buddy>
    40e4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    40e8:	48 29 c2             	sub    %rax,%rdx
    40eb:	48 c1 fa 03          	sar    $0x3,%rdx
    40ef:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    40f6:	aa aa aa 
    40f9:	48 0f af c2          	imul   %rdx,%rax
    40fd:	48 89 c3             	mov    %rax,%rbx
    4100:	b8 00 00 00 00       	mov    $0x0,%eax
    4105:	e8 6f f1 ff ff       	call   3279 <cpu_current>
    410a:	89 c6                	mov    %eax,%esi
    410c:	49 89 d8             	mov    %rbx,%r8
    410f:	b9 54 00 00 00       	mov    $0x54,%ecx
    4114:	48 8d 05 25 47 00 00 	lea    0x4725(%rip),%rax        # 8840 <__FUNCTION__.4>
    411b:	48 89 c2             	mov    %rax,%rdx
    411e:	48 8d 05 db 41 00 00 	lea    0x41db(%rip),%rax        # 8300 <_IO_stdin_used+0x300>
    4125:	48 89 c7             	mov    %rax,%rdi
    4128:	b8 00 00 00 00       	mov    $0x0,%eax
    412d:	e8 0e ef ff ff       	call   3040 <printf@plt>
    4132:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4136:	48 89 c7             	mov    %rax,%rdi
    4139:	e8 de f4 ff ff       	call   361c <spin_lock>
    413e:	48 8d 05 9b 90 00 00 	lea    0x909b(%rip),%rax        # d1e0 <buddy>
    4145:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    4149:	48 29 c2             	sub    %rax,%rdx
    414c:	48 c1 fa 03          	sar    $0x3,%rdx
    4150:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    4157:	aa aa aa 
    415a:	48 0f af c2          	imul   %rdx,%rax
    415e:	48 89 c3             	mov    %rax,%rbx
    4161:	b8 00 00 00 00       	mov    $0x0,%eax
    4166:	e8 0e f1 ff ff       	call   3279 <cpu_current>
    416b:	89 c6                	mov    %eax,%esi
    416d:	49 89 d8             	mov    %rbx,%r8
    4170:	b9 56 00 00 00       	mov    $0x56,%ecx
    4175:	48 8d 05 c4 46 00 00 	lea    0x46c4(%rip),%rax        # 8840 <__FUNCTION__.4>
    417c:	48 89 c2             	mov    %rax,%rdx
    417f:	48 8d 05 da 41 00 00 	lea    0x41da(%rip),%rax        # 8360 <_IO_stdin_used+0x360>
    4186:	48 89 c7             	mov    %rax,%rdi
    4189:	b8 00 00 00 00       	mov    $0x0,%eax
    418e:	e8 ad ee ff ff       	call   3040 <printf@plt>
    4193:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4197:	48 83 c0 08          	add    $0x8,%rax
    419b:	48 89 c2             	mov    %rax,%rdx
    419e:	48 c1 ea 03          	shr    $0x3,%rdx
    41a2:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    41a9:	0f b6 12             	movzbl (%rdx),%edx
    41ac:	84 d2                	test   %dl,%dl
    41ae:	74 08                	je     41b8 <buddy_fetch_best_chunk+0x115>
    41b0:	48 89 c7             	mov    %rax,%rdi
    41b3:	e8 88 ef ff ff       	call   3140 <__asan_report_load8@plt>
    41b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    41bc:	48 8b 40 08          	mov    0x8(%rax),%rax
    41c0:	48 85 c0             	test   %rax,%rax
    41c3:	0f 84 7a 01 00 00    	je     4343 <buddy_fetch_best_chunk+0x2a0>
    41c9:	48 8b 15 50 8f 00 00 	mov    0x8f50(%rip),%rdx        # d120 <heap>
    41d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    41d4:	48 8b 48 08          	mov    0x8(%rax),%rcx
    41d8:	48 8b 05 81 8f 00 00 	mov    0x8f81(%rip),%rax        # d160 <table>
    41df:	48 29 c1             	sub    %rax,%rcx
    41e2:	48 c1 f9 03          	sar    $0x3,%rcx
    41e6:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    41ed:	aa aa aa 
    41f0:	48 0f af c1          	imul   %rcx,%rax
    41f4:	48 c1 e0 0c          	shl    $0xc,%rax
    41f8:	48 01 d0             	add    %rdx,%rax
    41fb:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    41ff:	b8 00 00 00 00       	mov    $0x0,%eax
    4204:	e8 70 f0 ff ff       	call   3279 <cpu_current>
    4209:	89 c6                	mov    %eax,%esi
    420b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    420f:	49 89 c0             	mov    %rax,%r8
    4212:	b9 59 00 00 00       	mov    $0x59,%ecx
    4217:	48 8d 05 22 46 00 00 	lea    0x4622(%rip),%rax        # 8840 <__FUNCTION__.4>
    421e:	48 89 c2             	mov    %rax,%rdx
    4221:	48 8d 05 98 41 00 00 	lea    0x4198(%rip),%rax        # 83c0 <_IO_stdin_used+0x3c0>
    4228:	48 89 c7             	mov    %rax,%rdi
    422b:	b8 00 00 00 00       	mov    $0x0,%eax
    4230:	e8 0b ee ff ff       	call   3040 <printf@plt>
    4235:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4239:	48 83 c0 08          	add    $0x8,%rax
    423d:	48 89 c2             	mov    %rax,%rdx
    4240:	48 c1 ea 03          	shr    $0x3,%rdx
    4244:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    424b:	0f b6 12             	movzbl (%rdx),%edx
    424e:	84 d2                	test   %dl,%dl
    4250:	74 08                	je     425a <buddy_fetch_best_chunk+0x1b7>
    4252:	48 89 c7             	mov    %rax,%rdi
    4255:	e8 e6 ee ff ff       	call   3140 <__asan_report_load8@plt>
    425a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    425e:	48 8b 40 08          	mov    0x8(%rax),%rax
    4262:	48 8d 50 10          	lea    0x10(%rax),%rdx
    4266:	48 89 d1             	mov    %rdx,%rcx
    4269:	48 89 ca             	mov    %rcx,%rdx
    426c:	48 c1 ea 03          	shr    $0x3,%rdx
    4270:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    4277:	0f b6 12             	movzbl (%rdx),%edx
    427a:	84 d2                	test   %dl,%dl
    427c:	40 0f 95 c6          	setne  %sil
    4280:	84 d2                	test   %dl,%dl
    4282:	0f 9e c2             	setle  %dl
    4285:	21 f2                	and    %esi,%edx
    4287:	84 d2                	test   %dl,%dl
    4289:	74 08                	je     4293 <buddy_fetch_best_chunk+0x1f0>
    428b:	48 89 cf             	mov    %rcx,%rdi
    428e:	e8 8d ee ff ff       	call   3120 <__asan_report_load1@plt>
    4293:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    4297:	83 e0 20             	and    $0x20,%eax
    429a:	84 c0                	test   %al,%al
    429c:	74 2d                	je     42cb <buddy_fetch_best_chunk+0x228>
    429e:	e8 4d ee ff ff       	call   30f0 <__asan_handle_no_return@plt>
    42a3:	48 8d 05 d6 45 00 00 	lea    0x45d6(%rip),%rax        # 8880 <__PRETTY_FUNCTION__.3>
    42aa:	48 89 c1             	mov    %rax,%rcx
    42ad:	ba 5a 00 00 00       	mov    $0x5a,%edx
    42b2:	48 8d 05 87 3f 00 00 	lea    0x3f87(%rip),%rax        # 8240 <_IO_stdin_used+0x240>
    42b9:	48 89 c6             	mov    %rax,%rsi
    42bc:	48 8d 05 5d 41 00 00 	lea    0x415d(%rip),%rax        # 8420 <_IO_stdin_used+0x420>
    42c3:	48 89 c7             	mov    %rax,%rdi
    42c6:	e8 d5 ed ff ff       	call   30a0 <__assert_fail@plt>
    42cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    42cf:	48 83 c0 08          	add    $0x8,%rax
    42d3:	48 89 c2             	mov    %rax,%rdx
    42d6:	48 c1 ea 03          	shr    $0x3,%rdx
    42da:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    42e1:	0f b6 12             	movzbl (%rdx),%edx
    42e4:	84 d2                	test   %dl,%dl
    42e6:	74 08                	je     42f0 <buddy_fetch_best_chunk+0x24d>
    42e8:	48 89 c7             	mov    %rax,%rdi
    42eb:	e8 50 ee ff ff       	call   3140 <__asan_report_load8@plt>
    42f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    42f4:	48 8b 40 08          	mov    0x8(%rax),%rax
    42f8:	48 8d 50 10          	lea    0x10(%rax),%rdx
    42fc:	48 89 d1             	mov    %rdx,%rcx
    42ff:	48 89 ca             	mov    %rcx,%rdx
    4302:	48 c1 ea 03          	shr    $0x3,%rdx
    4306:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    430d:	0f b6 12             	movzbl (%rdx),%edx
    4310:	84 d2                	test   %dl,%dl
    4312:	40 0f 95 c6          	setne  %sil
    4316:	84 d2                	test   %dl,%dl
    4318:	0f 9e c2             	setle  %dl
    431b:	21 f2                	and    %esi,%edx
    431d:	84 d2                	test   %dl,%dl
    431f:	74 08                	je     4329 <buddy_fetch_best_chunk+0x286>
    4321:	48 89 cf             	mov    %rcx,%rdi
    4324:	e8 07 ee ff ff       	call   3130 <__asan_report_store1@plt>
    4329:	0f b6 50 10          	movzbl 0x10(%rax),%edx
    432d:	83 ca 20             	or     $0x20,%edx
    4330:	88 50 10             	mov    %dl,0x10(%rax)
    4333:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4337:	48 8b 40 08          	mov    0x8(%rax),%rax
    433b:	48 89 c7             	mov    %rax,%rdi
    433e:	e8 2c f8 ff ff       	call   3b6f <buddy_delete>
    4343:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4347:	48 89 c7             	mov    %rax,%rdi
    434a:	e8 fd f2 ff ff       	call   364c <spin_unlock>
    434f:	48 8d 05 8a 8e 00 00 	lea    0x8e8a(%rip),%rax        # d1e0 <buddy>
    4356:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    435a:	48 29 c2             	sub    %rax,%rdx
    435d:	48 c1 fa 03          	sar    $0x3,%rdx
    4361:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    4368:	aa aa aa 
    436b:	48 0f af c2          	imul   %rdx,%rax
    436f:	48 89 c3             	mov    %rax,%rbx
    4372:	b8 00 00 00 00       	mov    $0x0,%eax
    4377:	e8 fd ee ff ff       	call   3279 <cpu_current>
    437c:	89 c6                	mov    %eax,%esi
    437e:	49 89 d8             	mov    %rbx,%r8
    4381:	b9 5f 00 00 00       	mov    $0x5f,%ecx
    4386:	48 8d 05 b3 44 00 00 	lea    0x44b3(%rip),%rax        # 8840 <__FUNCTION__.4>
    438d:	48 89 c2             	mov    %rax,%rdx
    4390:	48 8d 05 c9 40 00 00 	lea    0x40c9(%rip),%rax        # 8460 <_IO_stdin_used+0x460>
    4397:	48 89 c7             	mov    %rax,%rdi
    439a:	b8 00 00 00 00       	mov    $0x0,%eax
    439f:	e8 9c ec ff ff       	call   3040 <printf@plt>
    43a4:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
    43a9:	75 10                	jne    43bb <buddy_fetch_best_chunk+0x318>
    43ab:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
    43af:	83 7d dc 18          	cmpl   $0x18,-0x24(%rbp)
    43b3:	0f 8e 03 fd ff ff    	jle    40bc <buddy_fetch_best_chunk+0x19>
    43b9:	eb 01                	jmp    43bc <buddy_fetch_best_chunk+0x319>
    43bb:	90                   	nop
    43bc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    43c0:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
    43c4:	c9                   	leave
    43c5:	c3                   	ret

00000000000043c6 <buddy_alloc>:
    43c6:	55                   	push   %rbp
    43c7:	48 89 e5             	mov    %rsp,%rbp
    43ca:	41 54                	push   %r12
    43cc:	53                   	push   %rbx
    43cd:	48 83 ec 40          	sub    $0x40,%rsp
    43d1:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    43d5:	c7 45 cc 0c 00 00 00 	movl   $0xc,-0x34(%rbp)
    43dc:	eb 04                	jmp    43e2 <buddy_alloc+0x1c>
    43de:	83 45 cc 01          	addl   $0x1,-0x34(%rbp)
    43e2:	83 7d cc 17          	cmpl   $0x17,-0x34(%rbp)
    43e6:	7f 16                	jg     43fe <buddy_alloc+0x38>
    43e8:	8b 45 cc             	mov    -0x34(%rbp),%eax
    43eb:	ba 01 00 00 00       	mov    $0x1,%edx
    43f0:	89 c1                	mov    %eax,%ecx
    43f2:	d3 e2                	shl    %cl,%edx
    43f4:	89 d0                	mov    %edx,%eax
    43f6:	48 98                	cltq
    43f8:	48 39 45 b8          	cmp    %rax,-0x48(%rbp)
    43fc:	75 e0                	jne    43de <buddy_alloc+0x18>
    43fe:	b8 00 00 00 00       	mov    $0x0,%eax
    4403:	e8 71 ee ff ff       	call   3279 <cpu_current>
    4408:	89 c6                	mov    %eax,%esi
    440a:	8b 45 cc             	mov    -0x34(%rbp),%eax
    440d:	41 89 c0             	mov    %eax,%r8d
    4410:	b9 6c 00 00 00       	mov    $0x6c,%ecx
    4415:	48 8d 05 a4 44 00 00 	lea    0x44a4(%rip),%rax        # 88c0 <__FUNCTION__.2>
    441c:	48 89 c2             	mov    %rax,%rdx
    441f:	48 8d 05 9a 40 00 00 	lea    0x409a(%rip),%rax        # 84c0 <_IO_stdin_used+0x4c0>
    4426:	48 89 c7             	mov    %rax,%rdi
    4429:	b8 00 00 00 00       	mov    $0x0,%eax
    442e:	e8 0d ec ff ff       	call   3040 <printf@plt>
    4433:	8b 45 cc             	mov    -0x34(%rbp),%eax
    4436:	89 c7                	mov    %eax,%edi
    4438:	e8 66 fc ff ff       	call   40a3 <buddy_fetch_best_chunk>
    443d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    4441:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
    4446:	75 0a                	jne    4452 <buddy_alloc+0x8c>
    4448:	b8 00 00 00 00       	mov    $0x0,%eax
    444d:	e9 0e 04 00 00       	jmp    4860 <buddy_alloc+0x49a>
    4452:	48 8b 15 07 8d 00 00 	mov    0x8d07(%rip),%rdx        # d160 <table>
    4459:	48 8b 05 c0 8c 00 00 	mov    0x8cc0(%rip),%rax        # d120 <heap>
    4460:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    4464:	48 29 c1             	sub    %rax,%rcx
    4467:	48 89 c8             	mov    %rcx,%rax
    446a:	48 8d 88 ff 0f 00 00 	lea    0xfff(%rax),%rcx
    4471:	48 85 c0             	test   %rax,%rax
    4474:	48 0f 48 c1          	cmovs  %rcx,%rax
    4478:	48 c1 f8 0c          	sar    $0xc,%rax
    447c:	48 89 c1             	mov    %rax,%rcx
    447f:	48 89 c8             	mov    %rcx,%rax
    4482:	48 01 c0             	add    %rax,%rax
    4485:	48 01 c8             	add    %rcx,%rax
    4488:	48 c1 e0 03          	shl    $0x3,%rax
    448c:	48 01 d0             	add    %rdx,%rax
    448f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    4493:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4497:	48 83 c0 10          	add    $0x10,%rax
    449b:	48 89 c2             	mov    %rax,%rdx
    449e:	48 89 d0             	mov    %rdx,%rax
    44a1:	48 c1 e8 03          	shr    $0x3,%rax
    44a5:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    44ab:	0f b6 00             	movzbl (%rax),%eax
    44ae:	84 c0                	test   %al,%al
    44b0:	0f 95 c1             	setne  %cl
    44b3:	84 c0                	test   %al,%al
    44b5:	0f 9e c0             	setle  %al
    44b8:	21 c8                	and    %ecx,%eax
    44ba:	84 c0                	test   %al,%al
    44bc:	74 08                	je     44c6 <buddy_alloc+0x100>
    44be:	48 89 d7             	mov    %rdx,%rdi
    44c1:	e8 5a ec ff ff       	call   3120 <__asan_report_load1@plt>
    44c6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    44ca:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    44ce:	83 e0 1f             	and    $0x1f,%eax
    44d1:	0f b6 c0             	movzbl %al,%eax
    44d4:	ba 01 00 00 00       	mov    $0x1,%edx
    44d9:	89 d3                	mov    %edx,%ebx
    44db:	89 c1                	mov    %eax,%ecx
    44dd:	d3 e3                	shl    %cl,%ebx
    44df:	b8 00 00 00 00       	mov    $0x0,%eax
    44e4:	e8 90 ed ff ff       	call   3279 <cpu_current>
    44e9:	89 c6                	mov    %eax,%esi
    44eb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    44ef:	41 89 d9             	mov    %ebx,%r9d
    44f2:	49 89 c0             	mov    %rax,%r8
    44f5:	b9 70 00 00 00       	mov    $0x70,%ecx
    44fa:	48 8d 05 bf 43 00 00 	lea    0x43bf(%rip),%rax        # 88c0 <__FUNCTION__.2>
    4501:	48 89 c2             	mov    %rax,%rdx
    4504:	48 8d 05 35 40 00 00 	lea    0x4035(%rip),%rax        # 8540 <_IO_stdin_used+0x540>
    450b:	48 89 c7             	mov    %rax,%rdi
    450e:	b8 00 00 00 00       	mov    $0x0,%eax
    4513:	e8 28 eb ff ff       	call   3040 <printf@plt>
    4518:	e9 f5 02 00 00       	jmp    4812 <buddy_alloc+0x44c>
    451d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4521:	48 83 c0 10          	add    $0x10,%rax
    4525:	48 89 c2             	mov    %rax,%rdx
    4528:	48 89 d0             	mov    %rdx,%rax
    452b:	48 c1 e8 03          	shr    $0x3,%rax
    452f:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    4535:	0f b6 00             	movzbl (%rax),%eax
    4538:	84 c0                	test   %al,%al
    453a:	0f 95 c1             	setne  %cl
    453d:	84 c0                	test   %al,%al
    453f:	0f 9e c0             	setle  %al
    4542:	21 c8                	and    %ecx,%eax
    4544:	84 c0                	test   %al,%al
    4546:	74 08                	je     4550 <buddy_alloc+0x18a>
    4548:	48 89 d7             	mov    %rdx,%rdi
    454b:	e8 d0 eb ff ff       	call   3120 <__asan_report_load1@plt>
    4550:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4554:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    4558:	83 e0 1f             	and    $0x1f,%eax
    455b:	83 c0 1f             	add    $0x1f,%eax
    455e:	83 e0 1f             	and    $0x1f,%eax
    4561:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    4565:	83 e0 1f             	and    $0x1f,%eax
    4568:	89 c1                	mov    %eax,%ecx
    456a:	0f b6 42 10          	movzbl 0x10(%rdx),%eax
    456e:	83 e0 e0             	and    $0xffffffe0,%eax
    4571:	09 c8                	or     %ecx,%eax
    4573:	88 42 10             	mov    %al,0x10(%rdx)
    4576:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    457a:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    457e:	83 e0 1f             	and    $0x1f,%eax
    4581:	0f b6 c0             	movzbl %al,%eax
    4584:	83 e8 0c             	sub    $0xc,%eax
    4587:	ba 01 00 00 00       	mov    $0x1,%edx
    458c:	89 c1                	mov    %eax,%ecx
    458e:	d3 e2                	shl    %cl,%edx
    4590:	89 d0                	mov    %edx,%eax
    4592:	48 63 d0             	movslq %eax,%rdx
    4595:	48 89 d0             	mov    %rdx,%rax
    4598:	48 01 c0             	add    %rax,%rax
    459b:	48 01 d0             	add    %rdx,%rax
    459e:	48 c1 e0 03          	shl    $0x3,%rax
    45a2:	48 89 c2             	mov    %rax,%rdx
    45a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    45a9:	48 01 d0             	add    %rdx,%rax
    45ac:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    45b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    45b4:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    45b8:	83 e0 1f             	and    $0x1f,%eax
    45bb:	89 c1                	mov    %eax,%ecx
    45bd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    45c1:	48 83 c0 10          	add    $0x10,%rax
    45c5:	48 89 c2             	mov    %rax,%rdx
    45c8:	48 89 d0             	mov    %rdx,%rax
    45cb:	48 c1 e8 03          	shr    $0x3,%rax
    45cf:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    45d5:	0f b6 00             	movzbl (%rax),%eax
    45d8:	84 c0                	test   %al,%al
    45da:	40 0f 95 c6          	setne  %sil
    45de:	84 c0                	test   %al,%al
    45e0:	0f 9e c0             	setle  %al
    45e3:	21 f0                	and    %esi,%eax
    45e5:	84 c0                	test   %al,%al
    45e7:	74 08                	je     45f1 <buddy_alloc+0x22b>
    45e9:	48 89 d7             	mov    %rdx,%rdi
    45ec:	e8 3f eb ff ff       	call   3130 <__asan_report_store1@plt>
    45f1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    45f5:	83 e1 1f             	and    $0x1f,%ecx
    45f8:	0f b6 50 10          	movzbl 0x10(%rax),%edx
    45fc:	83 e2 e0             	and    $0xffffffe0,%edx
    45ff:	09 ca                	or     %ecx,%edx
    4601:	88 50 10             	mov    %dl,0x10(%rax)
    4604:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    4608:	0f b6 50 10          	movzbl 0x10(%rax),%edx
    460c:	83 e2 df             	and    $0xffffffdf,%edx
    460f:	88 50 10             	mov    %dl,0x10(%rax)
    4612:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4616:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    461a:	83 e0 1f             	and    $0x1f,%eax
    461d:	0f b6 c0             	movzbl %al,%eax
    4620:	ba 01 00 00 00       	mov    $0x1,%edx
    4625:	89 c1                	mov    %eax,%ecx
    4627:	d3 e2                	shl    %cl,%edx
    4629:	41 89 d4             	mov    %edx,%r12d
    462c:	48 8b 15 ed 8a 00 00 	mov    0x8aed(%rip),%rdx        # d120 <heap>
    4633:	48 8b 05 26 8b 00 00 	mov    0x8b26(%rip),%rax        # d160 <table>
    463a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    463e:	48 29 c1             	sub    %rax,%rcx
    4641:	48 c1 f9 03          	sar    $0x3,%rcx
    4645:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    464c:	aa aa aa 
    464f:	48 0f af c1          	imul   %rcx,%rax
    4653:	48 c1 e0 0c          	shl    $0xc,%rax
    4657:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
    465b:	b8 00 00 00 00       	mov    $0x0,%eax
    4660:	e8 14 ec ff ff       	call   3279 <cpu_current>
    4665:	89 c6                	mov    %eax,%esi
    4667:	45 89 e1             	mov    %r12d,%r9d
    466a:	49 89 d8             	mov    %rbx,%r8
    466d:	b9 77 00 00 00       	mov    $0x77,%ecx
    4672:	48 8d 05 47 42 00 00 	lea    0x4247(%rip),%rax        # 88c0 <__FUNCTION__.2>
    4679:	48 89 c2             	mov    %rax,%rdx
    467c:	48 8d 05 3d 3f 00 00 	lea    0x3f3d(%rip),%rax        # 85c0 <_IO_stdin_used+0x5c0>
    4683:	48 89 c7             	mov    %rax,%rdi
    4686:	b8 00 00 00 00       	mov    $0x0,%eax
    468b:	e8 b0 e9 ff ff       	call   3040 <printf@plt>
    4690:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4694:	48 83 c0 10          	add    $0x10,%rax
    4698:	48 89 c2             	mov    %rax,%rdx
    469b:	48 89 d0             	mov    %rdx,%rax
    469e:	48 c1 e8 03          	shr    $0x3,%rax
    46a2:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    46a8:	0f b6 00             	movzbl (%rax),%eax
    46ab:	84 c0                	test   %al,%al
    46ad:	0f 95 c1             	setne  %cl
    46b0:	84 c0                	test   %al,%al
    46b2:	0f 9e c0             	setle  %al
    46b5:	21 c8                	and    %ecx,%eax
    46b7:	84 c0                	test   %al,%al
    46b9:	74 08                	je     46c3 <buddy_alloc+0x2fd>
    46bb:	48 89 d7             	mov    %rdx,%rdi
    46be:	e8 5d ea ff ff       	call   3120 <__asan_report_load1@plt>
    46c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    46c7:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    46cb:	83 e0 1f             	and    $0x1f,%eax
    46ce:	0f b6 c0             	movzbl %al,%eax
    46d1:	48 63 d0             	movslq %eax,%rdx
    46d4:	48 89 d0             	mov    %rdx,%rax
    46d7:	48 01 c0             	add    %rax,%rax
    46da:	48 01 d0             	add    %rdx,%rax
    46dd:	48 c1 e0 03          	shl    $0x3,%rax
    46e1:	48 8d 15 f8 8a 00 00 	lea    0x8af8(%rip),%rdx        # d1e0 <buddy>
    46e8:	48 01 d0             	add    %rdx,%rax
    46eb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    46ef:	48 8d 05 ea 8a 00 00 	lea    0x8aea(%rip),%rax        # d1e0 <buddy>
    46f6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    46fa:	48 29 c2             	sub    %rax,%rdx
    46fd:	48 c1 fa 03          	sar    $0x3,%rdx
    4701:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    4708:	aa aa aa 
    470b:	48 0f af c2          	imul   %rdx,%rax
    470f:	48 89 c3             	mov    %rax,%rbx
    4712:	b8 00 00 00 00       	mov    $0x0,%eax
    4717:	e8 5d eb ff ff       	call   3279 <cpu_current>
    471c:	89 c6                	mov    %eax,%esi
    471e:	49 89 d8             	mov    %rbx,%r8
    4721:	b9 79 00 00 00       	mov    $0x79,%ecx
    4726:	48 8d 05 93 41 00 00 	lea    0x4193(%rip),%rax        # 88c0 <__FUNCTION__.2>
    472d:	48 89 c2             	mov    %rax,%rdx
    4730:	48 8d 05 c9 3b 00 00 	lea    0x3bc9(%rip),%rax        # 8300 <_IO_stdin_used+0x300>
    4737:	48 89 c7             	mov    %rax,%rdi
    473a:	b8 00 00 00 00       	mov    $0x0,%eax
    473f:	e8 fc e8 ff ff       	call   3040 <printf@plt>
    4744:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4748:	48 89 c7             	mov    %rax,%rdi
    474b:	e8 cc ee ff ff       	call   361c <spin_lock>
    4750:	48 8d 05 89 8a 00 00 	lea    0x8a89(%rip),%rax        # d1e0 <buddy>
    4757:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    475b:	48 29 c2             	sub    %rax,%rdx
    475e:	48 c1 fa 03          	sar    $0x3,%rdx
    4762:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    4769:	aa aa aa 
    476c:	48 0f af c2          	imul   %rdx,%rax
    4770:	48 89 c3             	mov    %rax,%rbx
    4773:	b8 00 00 00 00       	mov    $0x0,%eax
    4778:	e8 fc ea ff ff       	call   3279 <cpu_current>
    477d:	89 c6                	mov    %eax,%esi
    477f:	49 89 d8             	mov    %rbx,%r8
    4782:	b9 7b 00 00 00       	mov    $0x7b,%ecx
    4787:	48 8d 05 32 41 00 00 	lea    0x4132(%rip),%rax        # 88c0 <__FUNCTION__.2>
    478e:	48 89 c2             	mov    %rax,%rdx
    4791:	48 8d 05 c8 3b 00 00 	lea    0x3bc8(%rip),%rax        # 8360 <_IO_stdin_used+0x360>
    4798:	48 89 c7             	mov    %rax,%rdi
    479b:	b8 00 00 00 00       	mov    $0x0,%eax
    47a0:	e8 9b e8 ff ff       	call   3040 <printf@plt>
    47a5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    47a9:	48 89 c7             	mov    %rax,%rdi
    47ac:	e8 3e f1 ff ff       	call   38ef <buddy_insert>
    47b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    47b5:	48 89 c7             	mov    %rax,%rdi
    47b8:	e8 8f ee ff ff       	call   364c <spin_unlock>
    47bd:	48 8d 05 1c 8a 00 00 	lea    0x8a1c(%rip),%rax        # d1e0 <buddy>
    47c4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    47c8:	48 29 c2             	sub    %rax,%rdx
    47cb:	48 c1 fa 03          	sar    $0x3,%rdx
    47cf:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    47d6:	aa aa aa 
    47d9:	48 0f af c2          	imul   %rdx,%rax
    47dd:	48 89 c3             	mov    %rax,%rbx
    47e0:	b8 00 00 00 00       	mov    $0x0,%eax
    47e5:	e8 8f ea ff ff       	call   3279 <cpu_current>
    47ea:	89 c6                	mov    %eax,%esi
    47ec:	49 89 d8             	mov    %rbx,%r8
    47ef:	b9 7e 00 00 00       	mov    $0x7e,%ecx
    47f4:	48 8d 05 c5 40 00 00 	lea    0x40c5(%rip),%rax        # 88c0 <__FUNCTION__.2>
    47fb:	48 89 c2             	mov    %rax,%rdx
    47fe:	48 8d 05 5b 3c 00 00 	lea    0x3c5b(%rip),%rax        # 8460 <_IO_stdin_used+0x460>
    4805:	48 89 c7             	mov    %rax,%rdi
    4808:	b8 00 00 00 00       	mov    $0x0,%eax
    480d:	e8 2e e8 ff ff       	call   3040 <printf@plt>
    4812:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4816:	48 83 c0 10          	add    $0x10,%rax
    481a:	48 89 c2             	mov    %rax,%rdx
    481d:	48 89 d0             	mov    %rdx,%rax
    4820:	48 c1 e8 03          	shr    $0x3,%rax
    4824:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    482a:	0f b6 00             	movzbl (%rax),%eax
    482d:	84 c0                	test   %al,%al
    482f:	0f 95 c1             	setne  %cl
    4832:	84 c0                	test   %al,%al
    4834:	0f 9e c0             	setle  %al
    4837:	21 c8                	and    %ecx,%eax
    4839:	84 c0                	test   %al,%al
    483b:	74 08                	je     4845 <buddy_alloc+0x47f>
    483d:	48 89 d7             	mov    %rdx,%rdi
    4840:	e8 db e8 ff ff       	call   3120 <__asan_report_load1@plt>
    4845:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4849:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    484d:	83 e0 1f             	and    $0x1f,%eax
    4850:	0f b6 c0             	movzbl %al,%eax
    4853:	39 45 cc             	cmp    %eax,-0x34(%rbp)
    4856:	0f 8c c1 fc ff ff    	jl     451d <buddy_alloc+0x157>
    485c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    4860:	48 83 c4 40          	add    $0x40,%rsp
    4864:	5b                   	pop    %rbx
    4865:	41 5c                	pop    %r12
    4867:	5d                   	pop    %rbp
    4868:	c3                   	ret

0000000000004869 <buddy_free>:
    4869:	55                   	push   %rbp
    486a:	48 89 e5             	mov    %rsp,%rbp
    486d:	53                   	push   %rbx
    486e:	48 83 ec 38          	sub    $0x38,%rsp
    4872:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    4876:	48 8b 15 e3 88 00 00 	mov    0x88e3(%rip),%rdx        # d160 <table>
    487d:	48 8b 05 9c 88 00 00 	mov    0x889c(%rip),%rax        # d120 <heap>
    4884:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    4888:	48 29 c1             	sub    %rax,%rcx
    488b:	48 89 c8             	mov    %rcx,%rax
    488e:	48 8d 88 ff 0f 00 00 	lea    0xfff(%rax),%rcx
    4895:	48 85 c0             	test   %rax,%rax
    4898:	48 0f 48 c1          	cmovs  %rcx,%rax
    489c:	48 c1 f8 0c          	sar    $0xc,%rax
    48a0:	48 89 c1             	mov    %rax,%rcx
    48a3:	48 89 c8             	mov    %rcx,%rax
    48a6:	48 01 c0             	add    %rax,%rax
    48a9:	48 01 c8             	add    %rcx,%rax
    48ac:	48 c1 e0 03          	shl    $0x3,%rax
    48b0:	48 01 d0             	add    %rdx,%rax
    48b3:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    48b7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    48bb:	48 83 c0 10          	add    $0x10,%rax
    48bf:	48 89 c2             	mov    %rax,%rdx
    48c2:	48 89 d0             	mov    %rdx,%rax
    48c5:	48 c1 e8 03          	shr    $0x3,%rax
    48c9:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    48cf:	0f b6 00             	movzbl (%rax),%eax
    48d2:	84 c0                	test   %al,%al
    48d4:	0f 95 c1             	setne  %cl
    48d7:	84 c0                	test   %al,%al
    48d9:	0f 9e c0             	setle  %al
    48dc:	21 c8                	and    %ecx,%eax
    48de:	84 c0                	test   %al,%al
    48e0:	74 08                	je     48ea <buddy_free+0x81>
    48e2:	48 89 d7             	mov    %rdx,%rdi
    48e5:	e8 36 e8 ff ff       	call   3120 <__asan_report_load1@plt>
    48ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    48ee:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    48f2:	83 e0 20             	and    $0x20,%eax
    48f5:	84 c0                	test   %al,%al
    48f7:	75 2d                	jne    4926 <buddy_free+0xbd>
    48f9:	e8 f2 e7 ff ff       	call   30f0 <__asan_handle_no_return@plt>
    48fe:	48 8d 05 fb 3f 00 00 	lea    0x3ffb(%rip),%rax        # 8900 <__PRETTY_FUNCTION__.1>
    4905:	48 89 c1             	mov    %rax,%rcx
    4908:	ba 85 00 00 00       	mov    $0x85,%edx
    490d:	48 8d 05 2c 39 00 00 	lea    0x392c(%rip),%rax        # 8240 <_IO_stdin_used+0x240>
    4914:	48 89 c6             	mov    %rax,%rsi
    4917:	48 8d 05 22 3d 00 00 	lea    0x3d22(%rip),%rax        # 8640 <_IO_stdin_used+0x640>
    491e:	48 89 c7             	mov    %rax,%rdi
    4921:	e8 7a e7 ff ff       	call   30a0 <__assert_fail@plt>
    4926:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    492a:	48 83 c0 10          	add    $0x10,%rax
    492e:	48 89 c2             	mov    %rax,%rdx
    4931:	48 89 d0             	mov    %rdx,%rax
    4934:	48 c1 e8 03          	shr    $0x3,%rax
    4938:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    493e:	0f b6 00             	movzbl (%rax),%eax
    4941:	84 c0                	test   %al,%al
    4943:	0f 95 c1             	setne  %cl
    4946:	84 c0                	test   %al,%al
    4948:	0f 9e c0             	setle  %al
    494b:	21 c8                	and    %ecx,%eax
    494d:	84 c0                	test   %al,%al
    494f:	74 08                	je     4959 <buddy_free+0xf0>
    4951:	48 89 d7             	mov    %rdx,%rdi
    4954:	e8 c7 e7 ff ff       	call   3120 <__asan_report_load1@plt>
    4959:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    495d:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    4961:	83 e0 1f             	and    $0x1f,%eax
    4964:	0f b6 c0             	movzbl %al,%eax
    4967:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    496a:	b8 00 00 00 00       	mov    $0x0,%eax
    496f:	e8 05 e9 ff ff       	call   3279 <cpu_current>
    4974:	89 c6                	mov    %eax,%esi
    4976:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    497a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    497d:	49 89 d1             	mov    %rdx,%r9
    4980:	41 89 c0             	mov    %eax,%r8d
    4983:	b9 87 00 00 00       	mov    $0x87,%ecx
    4988:	48 8d 05 b1 3f 00 00 	lea    0x3fb1(%rip),%rax        # 8940 <__FUNCTION__.0>
    498f:	48 89 c2             	mov    %rax,%rdx
    4992:	48 8d 05 e7 3c 00 00 	lea    0x3ce7(%rip),%rax        # 8680 <_IO_stdin_used+0x680>
    4999:	48 89 c7             	mov    %rax,%rdi
    499c:	b8 00 00 00 00       	mov    $0x0,%eax
    49a1:	e8 9a e6 ff ff       	call   3040 <printf@plt>
    49a6:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    49a9:	48 63 d0             	movslq %eax,%rdx
    49ac:	48 89 d0             	mov    %rdx,%rax
    49af:	48 01 c0             	add    %rax,%rax
    49b2:	48 01 d0             	add    %rdx,%rax
    49b5:	48 c1 e0 03          	shl    $0x3,%rax
    49b9:	48 8d 15 20 88 00 00 	lea    0x8820(%rip),%rdx        # d1e0 <buddy>
    49c0:	48 01 d0             	add    %rdx,%rax
    49c3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    49c7:	48 8d 05 12 88 00 00 	lea    0x8812(%rip),%rax        # d1e0 <buddy>
    49ce:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    49d2:	48 29 c2             	sub    %rax,%rdx
    49d5:	48 c1 fa 03          	sar    $0x3,%rdx
    49d9:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    49e0:	aa aa aa 
    49e3:	48 0f af c2          	imul   %rdx,%rax
    49e7:	48 89 c3             	mov    %rax,%rbx
    49ea:	b8 00 00 00 00       	mov    $0x0,%eax
    49ef:	e8 85 e8 ff ff       	call   3279 <cpu_current>
    49f4:	89 c6                	mov    %eax,%esi
    49f6:	49 89 d8             	mov    %rbx,%r8
    49f9:	b9 89 00 00 00       	mov    $0x89,%ecx
    49fe:	48 8d 05 3b 3f 00 00 	lea    0x3f3b(%rip),%rax        # 8940 <__FUNCTION__.0>
    4a05:	48 89 c2             	mov    %rax,%rdx
    4a08:	48 8d 05 f1 38 00 00 	lea    0x38f1(%rip),%rax        # 8300 <_IO_stdin_used+0x300>
    4a0f:	48 89 c7             	mov    %rax,%rdi
    4a12:	b8 00 00 00 00       	mov    $0x0,%eax
    4a17:	e8 24 e6 ff ff       	call   3040 <printf@plt>
    4a1c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    4a20:	48 89 c7             	mov    %rax,%rdi
    4a23:	e8 f4 eb ff ff       	call   361c <spin_lock>
    4a28:	48 8d 05 b1 87 00 00 	lea    0x87b1(%rip),%rax        # d1e0 <buddy>
    4a2f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    4a33:	48 29 c2             	sub    %rax,%rdx
    4a36:	48 c1 fa 03          	sar    $0x3,%rdx
    4a3a:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    4a41:	aa aa aa 
    4a44:	48 0f af c2          	imul   %rdx,%rax
    4a48:	48 89 c3             	mov    %rax,%rbx
    4a4b:	b8 00 00 00 00       	mov    $0x0,%eax
    4a50:	e8 24 e8 ff ff       	call   3279 <cpu_current>
    4a55:	89 c6                	mov    %eax,%esi
    4a57:	49 89 d8             	mov    %rbx,%r8
    4a5a:	b9 8b 00 00 00       	mov    $0x8b,%ecx
    4a5f:	48 8d 05 da 3e 00 00 	lea    0x3eda(%rip),%rax        # 8940 <__FUNCTION__.0>
    4a66:	48 89 c2             	mov    %rax,%rdx
    4a69:	48 8d 05 f0 38 00 00 	lea    0x38f0(%rip),%rax        # 8360 <_IO_stdin_used+0x360>
    4a70:	48 89 c7             	mov    %rax,%rdi
    4a73:	b8 00 00 00 00       	mov    $0x0,%eax
    4a78:	e8 c3 e5 ff ff       	call   3040 <printf@plt>
    4a7d:	e9 b3 03 00 00       	jmp    4e35 <buddy_free+0x5cc>
    4a82:	48 8b 35 d7 86 00 00 	mov    0x86d7(%rip),%rsi        # d160 <table>
    4a89:	48 8b 15 90 86 00 00 	mov    0x8690(%rip),%rdx        # d120 <heap>
    4a90:	48 8b 05 c9 86 00 00 	mov    0x86c9(%rip),%rax        # d160 <table>
    4a97:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    4a9b:	48 29 c1             	sub    %rax,%rcx
    4a9e:	48 c1 f9 03          	sar    $0x3,%rcx
    4aa2:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    4aa9:	aa aa aa 
    4aac:	48 0f af c1          	imul   %rcx,%rax
    4ab0:	48 c1 e0 0c          	shl    $0xc,%rax
    4ab4:	48 01 d0             	add    %rdx,%rax
    4ab7:	48 89 c7             	mov    %rax,%rdi
    4aba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4abe:	48 83 c0 10          	add    $0x10,%rax
    4ac2:	48 89 c2             	mov    %rax,%rdx
    4ac5:	48 89 d0             	mov    %rdx,%rax
    4ac8:	48 c1 e8 03          	shr    $0x3,%rax
    4acc:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    4ad2:	0f b6 00             	movzbl (%rax),%eax
    4ad5:	84 c0                	test   %al,%al
    4ad7:	0f 95 c1             	setne  %cl
    4ada:	84 c0                	test   %al,%al
    4adc:	0f 9e c0             	setle  %al
    4adf:	21 c8                	and    %ecx,%eax
    4ae1:	84 c0                	test   %al,%al
    4ae3:	74 08                	je     4aed <buddy_free+0x284>
    4ae5:	48 89 d7             	mov    %rdx,%rdi
    4ae8:	e8 33 e6 ff ff       	call   3120 <__asan_report_load1@plt>
    4aed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4af1:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    4af5:	83 e0 1f             	and    $0x1f,%eax
    4af8:	0f b6 c0             	movzbl %al,%eax
    4afb:	ba 01 00 00 00       	mov    $0x1,%edx
    4b00:	89 c1                	mov    %eax,%ecx
    4b02:	d3 e2                	shl    %cl,%edx
    4b04:	89 d0                	mov    %edx,%eax
    4b06:	48 98                	cltq
    4b08:	48 31 f8             	xor    %rdi,%rax
    4b0b:	48 89 c2             	mov    %rax,%rdx
    4b0e:	48 8b 05 0b 86 00 00 	mov    0x860b(%rip),%rax        # d120 <heap>
    4b15:	48 29 c2             	sub    %rax,%rdx
    4b18:	48 89 d0             	mov    %rdx,%rax
    4b1b:	48 8d 90 ff 0f 00 00 	lea    0xfff(%rax),%rdx
    4b22:	48 85 c0             	test   %rax,%rax
    4b25:	48 0f 48 c2          	cmovs  %rdx,%rax
    4b29:	48 c1 f8 0c          	sar    $0xc,%rax
    4b2d:	48 89 c2             	mov    %rax,%rdx
    4b30:	48 89 d0             	mov    %rdx,%rax
    4b33:	48 01 c0             	add    %rax,%rax
    4b36:	48 01 d0             	add    %rdx,%rax
    4b39:	48 c1 e0 03          	shl    $0x3,%rax
    4b3d:	48 01 f0             	add    %rsi,%rax
    4b40:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    4b44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4b48:	48 83 c0 10          	add    $0x10,%rax
    4b4c:	48 89 c2             	mov    %rax,%rdx
    4b4f:	48 89 d0             	mov    %rdx,%rax
    4b52:	48 c1 e8 03          	shr    $0x3,%rax
    4b56:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    4b5c:	0f b6 00             	movzbl (%rax),%eax
    4b5f:	84 c0                	test   %al,%al
    4b61:	0f 95 c1             	setne  %cl
    4b64:	84 c0                	test   %al,%al
    4b66:	0f 9e c0             	setle  %al
    4b69:	21 c8                	and    %ecx,%eax
    4b6b:	84 c0                	test   %al,%al
    4b6d:	74 08                	je     4b77 <buddy_free+0x30e>
    4b6f:	48 89 d7             	mov    %rdx,%rdi
    4b72:	e8 a9 e5 ff ff       	call   3120 <__asan_report_load1@plt>
    4b77:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4b7b:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    4b7f:	83 e0 20             	and    $0x20,%eax
    4b82:	84 c0                	test   %al,%al
    4b84:	0f 85 b5 02 00 00    	jne    4e3f <buddy_free+0x5d6>
    4b8a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4b8e:	48 83 c0 10          	add    $0x10,%rax
    4b92:	48 89 c2             	mov    %rax,%rdx
    4b95:	48 89 d0             	mov    %rdx,%rax
    4b98:	48 c1 e8 03          	shr    $0x3,%rax
    4b9c:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    4ba2:	0f b6 00             	movzbl (%rax),%eax
    4ba5:	84 c0                	test   %al,%al
    4ba7:	0f 95 c1             	setne  %cl
    4baa:	84 c0                	test   %al,%al
    4bac:	0f 9e c0             	setle  %al
    4baf:	21 c8                	and    %ecx,%eax
    4bb1:	84 c0                	test   %al,%al
    4bb3:	74 08                	je     4bbd <buddy_free+0x354>
    4bb5:	48 89 d7             	mov    %rdx,%rdi
    4bb8:	e8 63 e5 ff ff       	call   3120 <__asan_report_load1@plt>
    4bbd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4bc1:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    4bc5:	83 e0 1f             	and    $0x1f,%eax
    4bc8:	0f b6 c0             	movzbl %al,%eax
    4bcb:	39 45 d4             	cmp    %eax,-0x2c(%rbp)
    4bce:	0f 85 6b 02 00 00    	jne    4e3f <buddy_free+0x5d6>
    4bd4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4bd8:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    4bdc:	83 e0 40             	and    $0x40,%eax
    4bdf:	84 c0                	test   %al,%al
    4be1:	0f 85 58 02 00 00    	jne    4e3f <buddy_free+0x5d6>
    4be7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4beb:	0f b6 50 10          	movzbl 0x10(%rax),%edx
    4bef:	83 ca 20             	or     $0x20,%edx
    4bf2:	88 50 10             	mov    %dl,0x10(%rax)
    4bf5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4bf9:	48 89 c7             	mov    %rax,%rdi
    4bfc:	e8 6e ef ff ff       	call   3b6f <buddy_delete>
    4c01:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    4c05:	48 89 c7             	mov    %rax,%rdi
    4c08:	e8 3f ea ff ff       	call   364c <spin_unlock>
    4c0d:	48 8d 05 cc 85 00 00 	lea    0x85cc(%rip),%rax        # d1e0 <buddy>
    4c14:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    4c18:	48 29 c2             	sub    %rax,%rdx
    4c1b:	48 c1 fa 03          	sar    $0x3,%rdx
    4c1f:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    4c26:	aa aa aa 
    4c29:	48 0f af c2          	imul   %rdx,%rax
    4c2d:	48 89 c3             	mov    %rax,%rbx
    4c30:	b8 00 00 00 00       	mov    $0x0,%eax
    4c35:	e8 3f e6 ff ff       	call   3279 <cpu_current>
    4c3a:	89 c6                	mov    %eax,%esi
    4c3c:	49 89 d8             	mov    %rbx,%r8
    4c3f:	b9 94 00 00 00       	mov    $0x94,%ecx
    4c44:	48 8d 05 f5 3c 00 00 	lea    0x3cf5(%rip),%rax        # 8940 <__FUNCTION__.0>
    4c4b:	48 89 c2             	mov    %rax,%rdx
    4c4e:	48 8d 05 0b 38 00 00 	lea    0x380b(%rip),%rax        # 8460 <_IO_stdin_used+0x460>
    4c55:	48 89 c7             	mov    %rax,%rdi
    4c58:	b8 00 00 00 00       	mov    $0x0,%eax
    4c5d:	e8 de e3 ff ff       	call   3040 <printf@plt>
    4c62:	48 83 45 e0 18       	addq   $0x18,-0x20(%rbp)
    4c67:	48 8d 05 72 85 00 00 	lea    0x8572(%rip),%rax        # d1e0 <buddy>
    4c6e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    4c72:	48 29 c2             	sub    %rax,%rdx
    4c75:	48 c1 fa 03          	sar    $0x3,%rdx
    4c79:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    4c80:	aa aa aa 
    4c83:	48 0f af c2          	imul   %rdx,%rax
    4c87:	48 89 c3             	mov    %rax,%rbx
    4c8a:	b8 00 00 00 00       	mov    $0x0,%eax
    4c8f:	e8 e5 e5 ff ff       	call   3279 <cpu_current>
    4c94:	89 c6                	mov    %eax,%esi
    4c96:	49 89 d8             	mov    %rbx,%r8
    4c99:	b9 96 00 00 00       	mov    $0x96,%ecx
    4c9e:	48 8d 05 9b 3c 00 00 	lea    0x3c9b(%rip),%rax        # 8940 <__FUNCTION__.0>
    4ca5:	48 89 c2             	mov    %rax,%rdx
    4ca8:	48 8d 05 51 36 00 00 	lea    0x3651(%rip),%rax        # 8300 <_IO_stdin_used+0x300>
    4caf:	48 89 c7             	mov    %rax,%rdi
    4cb2:	b8 00 00 00 00       	mov    $0x0,%eax
    4cb7:	e8 84 e3 ff ff       	call   3040 <printf@plt>
    4cbc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    4cc0:	48 89 c7             	mov    %rax,%rdi
    4cc3:	e8 54 e9 ff ff       	call   361c <spin_lock>
    4cc8:	48 8d 05 11 85 00 00 	lea    0x8511(%rip),%rax        # d1e0 <buddy>
    4ccf:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    4cd3:	48 29 c2             	sub    %rax,%rdx
    4cd6:	48 c1 fa 03          	sar    $0x3,%rdx
    4cda:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    4ce1:	aa aa aa 
    4ce4:	48 0f af c2          	imul   %rdx,%rax
    4ce8:	48 89 c3             	mov    %rax,%rbx
    4ceb:	b8 00 00 00 00       	mov    $0x0,%eax
    4cf0:	e8 84 e5 ff ff       	call   3279 <cpu_current>
    4cf5:	89 c6                	mov    %eax,%esi
    4cf7:	49 89 d8             	mov    %rbx,%r8
    4cfa:	b9 98 00 00 00       	mov    $0x98,%ecx
    4cff:	48 8d 05 3a 3c 00 00 	lea    0x3c3a(%rip),%rax        # 8940 <__FUNCTION__.0>
    4d06:	48 89 c2             	mov    %rax,%rdx
    4d09:	48 8d 05 50 36 00 00 	lea    0x3650(%rip),%rax        # 8360 <_IO_stdin_used+0x360>
    4d10:	48 89 c7             	mov    %rax,%rdi
    4d13:	b8 00 00 00 00       	mov    $0x0,%eax
    4d18:	e8 23 e3 ff ff       	call   3040 <printf@plt>
    4d1d:	48 8b 35 3c 84 00 00 	mov    0x843c(%rip),%rsi        # d160 <table>
    4d24:	48 8b 15 f5 83 00 00 	mov    0x83f5(%rip),%rdx        # d120 <heap>
    4d2b:	48 8b 05 2e 84 00 00 	mov    0x842e(%rip),%rax        # d160 <table>
    4d32:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    4d36:	48 29 c1             	sub    %rax,%rcx
    4d39:	48 c1 f9 03          	sar    $0x3,%rcx
    4d3d:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    4d44:	aa aa aa 
    4d47:	48 0f af c1          	imul   %rcx,%rax
    4d4b:	48 c1 e0 0c          	shl    $0xc,%rax
    4d4f:	48 01 d0             	add    %rdx,%rax
    4d52:	48 89 c7             	mov    %rax,%rdi
    4d55:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4d59:	48 83 c0 10          	add    $0x10,%rax
    4d5d:	48 89 c2             	mov    %rax,%rdx
    4d60:	48 89 d0             	mov    %rdx,%rax
    4d63:	48 c1 e8 03          	shr    $0x3,%rax
    4d67:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    4d6d:	0f b6 00             	movzbl (%rax),%eax
    4d70:	84 c0                	test   %al,%al
    4d72:	0f 95 c1             	setne  %cl
    4d75:	84 c0                	test   %al,%al
    4d77:	0f 9e c0             	setle  %al
    4d7a:	21 c8                	and    %ecx,%eax
    4d7c:	84 c0                	test   %al,%al
    4d7e:	74 08                	je     4d88 <buddy_free+0x51f>
    4d80:	48 89 d7             	mov    %rdx,%rdi
    4d83:	e8 98 e3 ff ff       	call   3120 <__asan_report_load1@plt>
    4d88:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4d8c:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    4d90:	83 e0 1f             	and    $0x1f,%eax
    4d93:	0f b6 c0             	movzbl %al,%eax
    4d96:	ba 01 00 00 00       	mov    $0x1,%edx
    4d9b:	89 c1                	mov    %eax,%ecx
    4d9d:	d3 e2                	shl    %cl,%edx
    4d9f:	89 d0                	mov    %edx,%eax
    4da1:	f7 d0                	not    %eax
    4da3:	48 98                	cltq
    4da5:	48 21 f8             	and    %rdi,%rax
    4da8:	48 89 c2             	mov    %rax,%rdx
    4dab:	48 8b 05 6e 83 00 00 	mov    0x836e(%rip),%rax        # d120 <heap>
    4db2:	48 29 c2             	sub    %rax,%rdx
    4db5:	48 89 d0             	mov    %rdx,%rax
    4db8:	48 8d 90 ff 0f 00 00 	lea    0xfff(%rax),%rdx
    4dbf:	48 85 c0             	test   %rax,%rax
    4dc2:	48 0f 48 c2          	cmovs  %rdx,%rax
    4dc6:	48 c1 f8 0c          	sar    $0xc,%rax
    4dca:	48 89 c2             	mov    %rax,%rdx
    4dcd:	48 89 d0             	mov    %rdx,%rax
    4dd0:	48 01 c0             	add    %rax,%rax
    4dd3:	48 01 d0             	add    %rdx,%rax
    4dd6:	48 c1 e0 03          	shl    $0x3,%rax
    4dda:	48 01 f0             	add    %rsi,%rax
    4ddd:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    4de1:	83 45 d4 01          	addl   $0x1,-0x2c(%rbp)
    4de5:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    4de8:	83 e0 1f             	and    $0x1f,%eax
    4deb:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    4def:	48 83 c2 10          	add    $0x10,%rdx
    4df3:	48 89 d1             	mov    %rdx,%rcx
    4df6:	48 89 ca             	mov    %rcx,%rdx
    4df9:	48 c1 ea 03          	shr    $0x3,%rdx
    4dfd:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    4e04:	0f b6 12             	movzbl (%rdx),%edx
    4e07:	84 d2                	test   %dl,%dl
    4e09:	40 0f 95 c6          	setne  %sil
    4e0d:	84 d2                	test   %dl,%dl
    4e0f:	0f 9e c2             	setle  %dl
    4e12:	21 f2                	and    %esi,%edx
    4e14:	84 d2                	test   %dl,%dl
    4e16:	74 08                	je     4e20 <buddy_free+0x5b7>
    4e18:	48 89 cf             	mov    %rcx,%rdi
    4e1b:	e8 10 e3 ff ff       	call   3130 <__asan_report_store1@plt>
    4e20:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    4e24:	83 e0 1f             	and    $0x1f,%eax
    4e27:	89 c1                	mov    %eax,%ecx
    4e29:	0f b6 42 10          	movzbl 0x10(%rdx),%eax
    4e2d:	83 e0 e0             	and    $0xffffffe0,%eax
    4e30:	09 c8                	or     %ecx,%eax
    4e32:	88 42 10             	mov    %al,0x10(%rdx)
    4e35:	83 7d d4 17          	cmpl   $0x17,-0x2c(%rbp)
    4e39:	0f 8e 43 fc ff ff    	jle    4a82 <buddy_free+0x219>
    4e3f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4e43:	48 83 c0 10          	add    $0x10,%rax
    4e47:	48 89 c2             	mov    %rax,%rdx
    4e4a:	48 89 d0             	mov    %rdx,%rax
    4e4d:	48 c1 e8 03          	shr    $0x3,%rax
    4e51:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    4e57:	0f b6 00             	movzbl (%rax),%eax
    4e5a:	84 c0                	test   %al,%al
    4e5c:	0f 95 c1             	setne  %cl
    4e5f:	84 c0                	test   %al,%al
    4e61:	0f 9e c0             	setle  %al
    4e64:	21 c8                	and    %ecx,%eax
    4e66:	84 c0                	test   %al,%al
    4e68:	74 08                	je     4e72 <buddy_free+0x609>
    4e6a:	48 89 d7             	mov    %rdx,%rdi
    4e6d:	e8 be e2 ff ff       	call   3130 <__asan_report_store1@plt>
    4e72:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4e76:	0f b6 50 10          	movzbl 0x10(%rax),%edx
    4e7a:	83 e2 df             	and    $0xffffffdf,%edx
    4e7d:	88 50 10             	mov    %dl,0x10(%rax)
    4e80:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    4e84:	48 89 c7             	mov    %rax,%rdi
    4e87:	e8 63 ea ff ff       	call   38ef <buddy_insert>
    4e8c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    4e90:	48 89 c7             	mov    %rax,%rdi
    4e93:	e8 b4 e7 ff ff       	call   364c <spin_unlock>
    4e98:	48 8d 05 41 83 00 00 	lea    0x8341(%rip),%rax        # d1e0 <buddy>
    4e9f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    4ea3:	48 29 c2             	sub    %rax,%rdx
    4ea6:	48 c1 fa 03          	sar    $0x3,%rdx
    4eaa:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    4eb1:	aa aa aa 
    4eb4:	48 0f af c2          	imul   %rdx,%rax
    4eb8:	48 89 c3             	mov    %rax,%rbx
    4ebb:	b8 00 00 00 00       	mov    $0x0,%eax
    4ec0:	e8 b4 e3 ff ff       	call   3279 <cpu_current>
    4ec5:	89 c6                	mov    %eax,%esi
    4ec7:	49 89 d8             	mov    %rbx,%r8
    4eca:	b9 9f 00 00 00       	mov    $0x9f,%ecx
    4ecf:	48 8d 05 6a 3a 00 00 	lea    0x3a6a(%rip),%rax        # 8940 <__FUNCTION__.0>
    4ed6:	48 89 c2             	mov    %rax,%rdx
    4ed9:	48 8d 05 80 35 00 00 	lea    0x3580(%rip),%rax        # 8460 <_IO_stdin_used+0x460>
    4ee0:	48 89 c7             	mov    %rax,%rdi
    4ee3:	b8 00 00 00 00       	mov    $0x0,%eax
    4ee8:	e8 53 e1 ff ff       	call   3040 <printf@plt>
    4eed:	90                   	nop
    4eee:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
    4ef2:	c9                   	leave
    4ef3:	c3                   	ret

0000000000004ef4 <buddy_debug_print>:
    4ef4:	55                   	push   %rbp
    4ef5:	48 89 e5             	mov    %rsp,%rbp
    4ef8:	90                   	nop
    4ef9:	5d                   	pop    %rbp
    4efa:	c3                   	ret

0000000000004efb <_sub_D_00099_0>:
    4efb:	55                   	push   %rbp
    4efc:	48 89 e5             	mov    %rsp,%rbp
    4eff:	be 23 00 00 00       	mov    $0x23,%esi
    4f04:	48 8d 05 15 63 00 00 	lea    0x6315(%rip),%rax        # b220 <tptr+0x140>
    4f0b:	48 89 c7             	mov    %rax,%rdi
    4f0e:	e8 cd e1 ff ff       	call   30e0 <__asan_unregister_globals@plt>
    4f13:	5d                   	pop    %rbp
    4f14:	c3                   	ret

0000000000004f15 <_sub_I_00099_1>:
    4f15:	55                   	push   %rbp
    4f16:	48 89 e5             	mov    %rsp,%rbp
    4f19:	e8 e2 e1 ff ff       	call   3100 <__asan_init@plt>
    4f1e:	e8 2d e2 ff ff       	call   3150 <__asan_version_mismatch_check_v8@plt>
    4f23:	be 23 00 00 00       	mov    $0x23,%esi
    4f28:	48 8d 05 f1 62 00 00 	lea    0x62f1(%rip),%rax        # b220 <tptr+0x140>
    4f2f:	48 89 c7             	mov    %rax,%rdi
    4f32:	e8 19 e1 ff ff       	call   3050 <__asan_register_globals@plt>
    4f37:	5d                   	pop    %rbp
    4f38:	c3                   	ret

0000000000004f39 <wrapper>:
    4f39:	55                   	push   %rbp
    4f3a:	48 89 e5             	mov    %rsp,%rbp
    4f3d:	48 83 ec 20          	sub    $0x20,%rsp
    4f41:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    4f45:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    4f49:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    4f4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4f51:	48 83 c0 10          	add    $0x10,%rax
    4f55:	48 89 c2             	mov    %rax,%rdx
    4f58:	48 c1 ea 03          	shr    $0x3,%rdx
    4f5c:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    4f63:	0f b6 12             	movzbl (%rdx),%edx
    4f66:	84 d2                	test   %dl,%dl
    4f68:	74 08                	je     4f72 <wrapper+0x39>
    4f6a:	48 89 c7             	mov    %rax,%rdi
    4f6d:	e8 ce e1 ff ff       	call   3140 <__asan_report_load8@plt>
    4f72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4f76:	48 8b 48 10          	mov    0x10(%rax),%rcx
    4f7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4f7e:	48 89 c2             	mov    %rax,%rdx
    4f81:	48 89 d0             	mov    %rdx,%rax
    4f84:	48 c1 e8 03          	shr    $0x3,%rax
    4f88:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    4f8e:	0f b6 00             	movzbl (%rax),%eax
    4f91:	84 c0                	test   %al,%al
    4f93:	40 0f 95 c6          	setne  %sil
    4f97:	3c 03                	cmp    $0x3,%al
    4f99:	0f 9e c0             	setle  %al
    4f9c:	21 f0                	and    %esi,%eax
    4f9e:	84 c0                	test   %al,%al
    4fa0:	74 08                	je     4faa <wrapper+0x71>
    4fa2:	48 89 d7             	mov    %rdx,%rdi
    4fa5:	e8 e6 e0 ff ff       	call   3090 <__asan_report_load4@plt>
    4faa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    4fae:	8b 00                	mov    (%rax),%eax
    4fb0:	89 c7                	mov    %eax,%edi
    4fb2:	ff d1                	call   *%rcx
    4fb4:	b8 00 00 00 00       	mov    $0x0,%eax
    4fb9:	c9                   	leave
    4fba:	c3                   	ret

0000000000004fbb <create>:
    4fbb:	55                   	push   %rbp
    4fbc:	48 89 e5             	mov    %rsp,%rbp
    4fbf:	48 83 ec 30          	sub    $0x30,%rsp
    4fc3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    4fc7:	48 8b 15 12 6b 00 00 	mov    0x6b12(%rip),%rdx        # bae0 <tptr>
    4fce:	48 8d 05 4b 85 00 00 	lea    0x854b(%rip),%rax        # d520 <tpool>
    4fd5:	48 29 c2             	sub    %rax,%rdx
    4fd8:	48 81 fa e8 05 00 00 	cmp    $0x5e8,%rdx
    4fdf:	7e 2d                	jle    500e <create+0x53>
    4fe1:	e8 0a e1 ff ff       	call   30f0 <__asan_handle_no_return@plt>
    4fe6:	48 8d 05 73 3b 00 00 	lea    0x3b73(%rip),%rax        # 8b60 <__PRETTY_FUNCTION__.0>
    4fed:	48 89 c1             	mov    %rax,%rcx
    4ff0:	ba 28 00 00 00       	mov    $0x28,%edx
    4ff5:	48 8d 05 64 3a 00 00 	lea    0x3a64(%rip),%rax        # 8a60 <__FUNCTION__.0+0x120>
    4ffc:	48 89 c6             	mov    %rax,%rsi
    4fff:	48 8d 05 9a 3a 00 00 	lea    0x3a9a(%rip),%rax        # 8aa0 <__FUNCTION__.0+0x160>
    5006:	48 89 c7             	mov    %rax,%rdi
    5009:	e8 92 e0 ff ff       	call   30a0 <__assert_fail@plt>
    500e:	48 8b 05 cb 6a 00 00 	mov    0x6acb(%rip),%rax        # bae0 <tptr>
    5015:	48 8b 0d c4 6a 00 00 	mov    0x6ac4(%rip),%rcx        # bae0 <tptr>
    501c:	48 8d 15 fd 84 00 00 	lea    0x84fd(%rip),%rdx        # d520 <tpool>
    5023:	48 29 d1             	sub    %rdx,%rcx
    5026:	48 c1 f9 03          	sar    $0x3,%rcx
    502a:	48 ba ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rdx
    5031:	aa aa aa 
    5034:	48 0f af d1          	imul   %rcx,%rdx
    5038:	83 c2 01             	add    $0x1,%edx
    503b:	41 89 d0             	mov    %edx,%r8d
    503e:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
    5042:	48 89 c2             	mov    %rax,%rdx
    5045:	48 89 d1             	mov    %rdx,%rcx
    5048:	48 c1 e9 03          	shr    $0x3,%rcx
    504c:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    5053:	0f b6 09             	movzbl (%rcx),%ecx
    5056:	84 c9                	test   %cl,%cl
    5058:	40 0f 95 c6          	setne  %sil
    505c:	84 c9                	test   %cl,%cl
    505e:	0f 9e c1             	setle  %cl
    5061:	21 ce                	and    %ecx,%esi
    5063:	41 89 f1             	mov    %esi,%r9d
    5066:	b9 18 00 00 00       	mov    $0x18,%ecx
    506b:	48 83 e9 01          	sub    $0x1,%rcx
    506f:	48 8d 34 0a          	lea    (%rdx,%rcx,1),%rsi
    5073:	48 89 f1             	mov    %rsi,%rcx
    5076:	48 c1 e9 03          	shr    $0x3,%rcx
    507a:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    5081:	0f b6 09             	movzbl (%rcx),%ecx
    5084:	84 c9                	test   %cl,%cl
    5086:	41 0f 95 c2          	setne  %r10b
    508a:	83 e6 07             	and    $0x7,%esi
    508d:	40 38 ce             	cmp    %cl,%sil
    5090:	0f 9d c1             	setge  %cl
    5093:	44 21 d1             	and    %r10d,%ecx
    5096:	44 09 c9             	or     %r9d,%ecx
    5099:	84 c9                	test   %cl,%cl
    509b:	74 0d                	je     50aa <create+0xef>
    509d:	be 18 00 00 00       	mov    $0x18,%esi
    50a2:	48 89 d7             	mov    %rdx,%rdi
    50a5:	e8 c6 e0 ff ff       	call   3170 <__asan_report_store_n@plt>
    50aa:	66 0f ef c0          	pxor   %xmm0,%xmm0
    50ae:	0f 11 00             	movups %xmm0,(%rax)
    50b1:	66 0f d6 40 10       	movq   %xmm0,0x10(%rax)
    50b6:	48 89 c2             	mov    %rax,%rdx
    50b9:	48 89 d1             	mov    %rdx,%rcx
    50bc:	48 89 ca             	mov    %rcx,%rdx
    50bf:	48 c1 ea 03          	shr    $0x3,%rdx
    50c3:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    50ca:	0f b6 12             	movzbl (%rdx),%edx
    50cd:	84 d2                	test   %dl,%dl
    50cf:	40 0f 95 c6          	setne  %sil
    50d3:	80 fa 03             	cmp    $0x3,%dl
    50d6:	0f 9e c2             	setle  %dl
    50d9:	21 f2                	and    %esi,%edx
    50db:	84 d2                	test   %dl,%dl
    50dd:	74 08                	je     50e7 <create+0x12c>
    50df:	48 89 cf             	mov    %rcx,%rdi
    50e2:	e8 49 df ff ff       	call   3030 <__asan_report_store4@plt>
    50e7:	44 89 00             	mov    %r8d,(%rax)
    50ea:	48 8d 50 04          	lea    0x4(%rax),%rdx
    50ee:	48 89 d1             	mov    %rdx,%rcx
    50f1:	48 c1 e9 03          	shr    $0x3,%rcx
    50f5:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    50fc:	0f b6 09             	movzbl (%rcx),%ecx
    50ff:	84 c9                	test   %cl,%cl
    5101:	41 0f 95 c0          	setne  %r8b
    5105:	48 89 d6             	mov    %rdx,%rsi
    5108:	83 e6 07             	and    $0x7,%esi
    510b:	83 c6 03             	add    $0x3,%esi
    510e:	40 38 ce             	cmp    %cl,%sil
    5111:	0f 9d c1             	setge  %cl
    5114:	44 21 c1             	and    %r8d,%ecx
    5117:	84 c9                	test   %cl,%cl
    5119:	74 08                	je     5123 <create+0x168>
    511b:	48 89 d7             	mov    %rdx,%rdi
    511e:	e8 0d df ff ff       	call   3030 <__asan_report_store4@plt>
    5123:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%rax)
    512a:	48 8d 50 10          	lea    0x10(%rax),%rdx
    512e:	48 89 d1             	mov    %rdx,%rcx
    5131:	48 c1 e9 03          	shr    $0x3,%rcx
    5135:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    513c:	0f b6 09             	movzbl (%rcx),%ecx
    513f:	84 c9                	test   %cl,%cl
    5141:	74 08                	je     514b <create+0x190>
    5143:	48 89 d7             	mov    %rdx,%rdi
    5146:	e8 85 df ff ff       	call   30d0 <__asan_report_store8@plt>
    514b:	48 89 78 10          	mov    %rdi,0x10(%rax)
    514f:	48 8b 05 8a 69 00 00 	mov    0x698a(%rip),%rax        # bae0 <tptr>
    5156:	48 8b 15 83 69 00 00 	mov    0x6983(%rip),%rdx        # bae0 <tptr>
    515d:	48 8d 7a 08          	lea    0x8(%rdx),%rdi
    5161:	48 89 c1             	mov    %rax,%rcx
    5164:	48 8d 05 ce fd ff ff 	lea    -0x232(%rip),%rax        # 4f39 <wrapper>
    516b:	48 89 c2             	mov    %rax,%rdx
    516e:	be 00 00 00 00       	mov    $0x0,%esi
    5173:	e8 f8 de ff ff       	call   3070 <pthread_create@plt>
    5178:	48 8b 05 61 69 00 00 	mov    0x6961(%rip),%rax        # bae0 <tptr>
    517f:	48 83 c0 18          	add    $0x18,%rax
    5183:	48 89 05 56 69 00 00 	mov    %rax,0x6956(%rip)        # bae0 <tptr>
    518a:	90                   	nop
    518b:	c9                   	leave
    518c:	c3                   	ret

000000000000518d <join>:
    518d:	55                   	push   %rbp
    518e:	48 89 e5             	mov    %rsp,%rbp
    5191:	48 83 ec 10          	sub    $0x10,%rsp
    5195:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    519c:	e9 f0 00 00 00       	jmp    5291 <join+0x104>
    51a1:	8b 45 f4             	mov    -0xc(%rbp),%eax
    51a4:	48 63 d0             	movslq %eax,%rdx
    51a7:	48 89 d0             	mov    %rdx,%rax
    51aa:	48 01 c0             	add    %rax,%rax
    51ad:	48 01 d0             	add    %rdx,%rax
    51b0:	48 c1 e0 03          	shl    $0x3,%rax
    51b4:	48 8d 15 65 83 00 00 	lea    0x8365(%rip),%rdx        # d520 <tpool>
    51bb:	48 01 d0             	add    %rdx,%rax
    51be:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    51c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    51c6:	48 83 c0 04          	add    $0x4,%rax
    51ca:	48 89 c2             	mov    %rax,%rdx
    51cd:	48 c1 ea 03          	shr    $0x3,%rdx
    51d1:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    51d8:	0f b6 12             	movzbl (%rdx),%edx
    51db:	84 d2                	test   %dl,%dl
    51dd:	40 0f 95 c6          	setne  %sil
    51e1:	48 89 c1             	mov    %rax,%rcx
    51e4:	83 e1 07             	and    $0x7,%ecx
    51e7:	83 c1 03             	add    $0x3,%ecx
    51ea:	38 d1                	cmp    %dl,%cl
    51ec:	0f 9d c2             	setge  %dl
    51ef:	21 f2                	and    %esi,%edx
    51f1:	84 d2                	test   %dl,%dl
    51f3:	74 08                	je     51fd <join+0x70>
    51f5:	48 89 c7             	mov    %rax,%rdi
    51f8:	e8 93 de ff ff       	call   3090 <__asan_report_load4@plt>
    51fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5201:	8b 40 04             	mov    0x4(%rax),%eax
    5204:	83 f8 01             	cmp    $0x1,%eax
    5207:	0f 85 80 00 00 00    	jne    528d <join+0x100>
    520d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5211:	48 83 c0 08          	add    $0x8,%rax
    5215:	48 89 c2             	mov    %rax,%rdx
    5218:	48 c1 ea 03          	shr    $0x3,%rdx
    521c:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    5223:	0f b6 12             	movzbl (%rdx),%edx
    5226:	84 d2                	test   %dl,%dl
    5228:	74 08                	je     5232 <join+0xa5>
    522a:	48 89 c7             	mov    %rax,%rdi
    522d:	e8 0e df ff ff       	call   3140 <__asan_report_load8@plt>
    5232:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5236:	48 8b 40 08          	mov    0x8(%rax),%rax
    523a:	be 00 00 00 00       	mov    $0x0,%esi
    523f:	48 89 c7             	mov    %rax,%rdi
    5242:	e8 19 df ff ff       	call   3160 <pthread_join@plt>
    5247:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    524b:	48 83 c0 04          	add    $0x4,%rax
    524f:	48 89 c2             	mov    %rax,%rdx
    5252:	48 c1 ea 03          	shr    $0x3,%rdx
    5256:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    525d:	0f b6 12             	movzbl (%rdx),%edx
    5260:	84 d2                	test   %dl,%dl
    5262:	40 0f 95 c6          	setne  %sil
    5266:	48 89 c1             	mov    %rax,%rcx
    5269:	83 e1 07             	and    $0x7,%ecx
    526c:	83 c1 03             	add    $0x3,%ecx
    526f:	38 d1                	cmp    %dl,%cl
    5271:	0f 9d c2             	setge  %dl
    5274:	21 f2                	and    %esi,%edx
    5276:	84 d2                	test   %dl,%dl
    5278:	74 08                	je     5282 <join+0xf5>
    527a:	48 89 c7             	mov    %rax,%rdi
    527d:	e8 ae dd ff ff       	call   3030 <__asan_report_store4@plt>
    5282:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5286:	c7 40 04 02 00 00 00 	movl   $0x2,0x4(%rax)
    528d:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    5291:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%rbp)
    5295:	0f 8e 06 ff ff ff    	jle    51a1 <join+0x14>
    529b:	90                   	nop
    529c:	90                   	nop
    529d:	c9                   	leave
    529e:	c3                   	ret

000000000000529f <cleanup>:
    529f:	55                   	push   %rbp
    52a0:	48 89 e5             	mov    %rsp,%rbp
    52a3:	b8 00 00 00 00       	mov    $0x0,%eax
    52a8:	e8 e0 fe ff ff       	call   518d <join>
    52ad:	90                   	nop
    52ae:	5d                   	pop    %rbp
    52af:	c3                   	ret

00000000000052b0 <align>:
    52b0:	55                   	push   %rbp
    52b1:	48 89 e5             	mov    %rsp,%rbp
    52b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    52b8:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
    52bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    52c1:	48 d1 e8             	shr    %rax
    52c4:	48 09 45 f8          	or     %rax,-0x8(%rbp)
    52c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    52cc:	48 c1 e8 02          	shr    $0x2,%rax
    52d0:	48 09 45 f8          	or     %rax,-0x8(%rbp)
    52d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    52d8:	48 c1 e8 04          	shr    $0x4,%rax
    52dc:	48 09 45 f8          	or     %rax,-0x8(%rbp)
    52e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    52e4:	48 c1 e8 08          	shr    $0x8,%rax
    52e8:	48 09 45 f8          	or     %rax,-0x8(%rbp)
    52ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    52f0:	48 c1 e8 10          	shr    $0x10,%rax
    52f4:	48 09 45 f8          	or     %rax,-0x8(%rbp)
    52f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    52fc:	48 83 c0 01          	add    $0x1,%rax
    5300:	5d                   	pop    %rbp
    5301:	c3                   	ret

0000000000005302 <kalloc>:
    5302:	55                   	push   %rbp
    5303:	48 89 e5             	mov    %rsp,%rbp
    5306:	48 83 ec 10          	sub    $0x10,%rsp
    530a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    530e:	48 81 7d f8 00 00 00 	cmpq   $0x1000000,-0x8(%rbp)
    5315:	01 
    5316:	76 07                	jbe    531f <kalloc+0x1d>
    5318:	b8 00 00 00 00       	mov    $0x0,%eax
    531d:	eb 43                	jmp    5362 <kalloc+0x60>
    531f:	48 83 7d f8 07       	cmpq   $0x7,-0x8(%rbp)
    5324:	77 08                	ja     532e <kalloc+0x2c>
    5326:	48 c7 45 f8 08 00 00 	movq   $0x8,-0x8(%rbp)
    532d:	00 
    532e:	48 81 7d f8 ff 0f 00 	cmpq   $0xfff,-0x8(%rbp)
    5335:	00 
    5336:	76 16                	jbe    534e <kalloc+0x4c>
    5338:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    533c:	48 89 c7             	mov    %rax,%rdi
    533f:	e8 6c ff ff ff       	call   52b0 <align>
    5344:	48 89 c7             	mov    %rax,%rdi
    5347:	e8 7a f0 ff ff       	call   43c6 <buddy_alloc>
    534c:	eb 14                	jmp    5362 <kalloc+0x60>
    534e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5352:	48 89 c7             	mov    %rax,%rdi
    5355:	e8 56 ff ff ff       	call   52b0 <align>
    535a:	48 89 c7             	mov    %rax,%rdi
    535d:	e8 83 13 00 00       	call   66e5 <slab_alloc>
    5362:	c9                   	leave
    5363:	c3                   	ret

0000000000005364 <kfree>:
    5364:	55                   	push   %rbp
    5365:	48 89 e5             	mov    %rsp,%rbp
    5368:	48 83 ec 20          	sub    $0x20,%rsp
    536c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    5370:	48 8d 05 e9 7d 00 00 	lea    0x7de9(%rip),%rax        # d160 <table>
    5377:	48 89 c2             	mov    %rax,%rdx
    537a:	48 c1 ea 03          	shr    $0x3,%rdx
    537e:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    5385:	0f b6 12             	movzbl (%rdx),%edx
    5388:	84 d2                	test   %dl,%dl
    538a:	74 08                	je     5394 <kfree+0x30>
    538c:	48 89 c7             	mov    %rax,%rdi
    538f:	e8 ac dd ff ff       	call   3140 <__asan_report_load8@plt>
    5394:	48 8b 15 c5 7d 00 00 	mov    0x7dc5(%rip),%rdx        # d160 <table>
    539b:	48 8b 05 9e 87 00 00 	mov    0x879e(%rip),%rax        # db40 <heap>
    53a2:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    53a6:	48 29 c1             	sub    %rax,%rcx
    53a9:	48 89 c8             	mov    %rcx,%rax
    53ac:	48 8d 88 ff 0f 00 00 	lea    0xfff(%rax),%rcx
    53b3:	48 85 c0             	test   %rax,%rax
    53b6:	48 0f 48 c1          	cmovs  %rcx,%rax
    53ba:	48 c1 f8 0c          	sar    $0xc,%rax
    53be:	48 89 c1             	mov    %rax,%rcx
    53c1:	48 89 c8             	mov    %rcx,%rax
    53c4:	48 01 c0             	add    %rax,%rax
    53c7:	48 01 c8             	add    %rcx,%rax
    53ca:	48 c1 e0 03          	shl    $0x3,%rax
    53ce:	48 01 d0             	add    %rdx,%rax
    53d1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    53d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    53d9:	48 83 c0 10          	add    $0x10,%rax
    53dd:	48 89 c2             	mov    %rax,%rdx
    53e0:	48 89 d0             	mov    %rdx,%rax
    53e3:	48 c1 e8 03          	shr    $0x3,%rax
    53e7:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    53ed:	0f b6 00             	movzbl (%rax),%eax
    53f0:	84 c0                	test   %al,%al
    53f2:	0f 95 c1             	setne  %cl
    53f5:	84 c0                	test   %al,%al
    53f7:	0f 9e c0             	setle  %al
    53fa:	21 c8                	and    %ecx,%eax
    53fc:	84 c0                	test   %al,%al
    53fe:	74 08                	je     5408 <kfree+0xa4>
    5400:	48 89 d7             	mov    %rdx,%rdi
    5403:	e8 18 dd ff ff       	call   3120 <__asan_report_load1@plt>
    5408:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    540c:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    5410:	83 e0 40             	and    $0x40,%eax
    5413:	84 c0                	test   %al,%al
    5415:	74 0e                	je     5425 <kfree+0xc1>
    5417:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    541b:	48 89 c7             	mov    %rax,%rdi
    541e:	e8 f7 13 00 00       	call   681a <slab_free>
    5423:	eb 0c                	jmp    5431 <kfree+0xcd>
    5425:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    5429:	48 89 c7             	mov    %rax,%rdi
    542c:	e8 38 f4 ff ff       	call   4869 <buddy_free>
    5431:	90                   	nop
    5432:	c9                   	leave
    5433:	c3                   	ret

0000000000005434 <pmm_init>:
    5434:	55                   	push   %rbp
    5435:	48 89 e5             	mov    %rsp,%rbp
    5438:	48 83 ec 10          	sub    $0x10,%rsp
    543c:	48 8b 15 05 87 00 00 	mov    0x8705(%rip),%rdx        # db48 <heap+0x8>
    5443:	48 8b 05 f6 86 00 00 	mov    0x86f6(%rip),%rax        # db40 <heap>
    544a:	48 29 c2             	sub    %rax,%rdx
    544d:	48 89 d0             	mov    %rdx,%rax
    5450:	48 89 c7             	mov    %rax,%rdi
    5453:	e8 b8 dc ff ff       	call   3110 <malloc@plt>
    5458:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    545c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5460:	48 89 05 d9 86 00 00 	mov    %rax,0x86d9(%rip)        # db40 <heap>
    5467:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    546b:	48 05 00 00 00 20    	add    $0x20000000,%rax
    5471:	48 89 05 d0 86 00 00 	mov    %rax,0x86d0(%rip)        # db48 <heap+0x8>
    5478:	48 8b 15 c9 86 00 00 	mov    0x86c9(%rip),%rdx        # db48 <heap+0x8>
    547f:	48 8b 05 ba 86 00 00 	mov    0x86ba(%rip),%rax        # db40 <heap>
    5486:	48 89 d1             	mov    %rdx,%rcx
    5489:	48 89 c2             	mov    %rax,%rdx
    548c:	be 00 02 00 00       	mov    $0x200,%esi
    5491:	48 8d 05 48 36 00 00 	lea    0x3648(%rip),%rax        # 8ae0 <__FUNCTION__.0+0x1a0>
    5498:	48 89 c7             	mov    %rax,%rdi
    549b:	b8 00 00 00 00       	mov    $0x0,%eax
    54a0:	e8 9b db ff ff       	call   3040 <printf@plt>
    54a5:	48 8d 05 94 86 00 00 	lea    0x8694(%rip),%rax        # db40 <heap>
    54ac:	48 89 c6             	mov    %rax,%rsi
    54af:	48 8d 05 6a 36 00 00 	lea    0x366a(%rip),%rax        # 8b20 <__FUNCTION__.0+0x1e0>
    54b6:	48 89 c7             	mov    %rax,%rdi
    54b9:	b8 00 00 00 00       	mov    $0x0,%eax
    54be:	e8 7d db ff ff       	call   3040 <printf@plt>
    54c3:	b8 00 00 00 00       	mov    $0x0,%eax
    54c8:	e8 9f e1 ff ff       	call   366c <init_buddy>
    54cd:	b8 00 00 00 00       	mov    $0x0,%eax
    54d2:	e8 9a 0e 00 00       	call   6371 <slab_init>
    54d7:	90                   	nop
    54d8:	c9                   	leave
    54d9:	c3                   	ret

00000000000054da <_sub_D_00099_0>:
    54da:	55                   	push   %rbp
    54db:	48 89 e5             	mov    %rsp,%rbp
    54de:	be 0a 00 00 00       	mov    $0xa,%esi
    54e3:	48 8d 05 16 67 00 00 	lea    0x6716(%rip),%rax        # bc00 <__pmm_obj+0xa0>
    54ea:	48 89 c7             	mov    %rax,%rdi
    54ed:	e8 ee db ff ff       	call   30e0 <__asan_unregister_globals@plt>
    54f2:	5d                   	pop    %rbp
    54f3:	c3                   	ret

00000000000054f4 <_sub_I_00099_1>:
    54f4:	55                   	push   %rbp
    54f5:	48 89 e5             	mov    %rsp,%rbp
    54f8:	e8 03 dc ff ff       	call   3100 <__asan_init@plt>
    54fd:	e8 4e dc ff ff       	call   3150 <__asan_version_mismatch_check_v8@plt>
    5502:	be 0a 00 00 00       	mov    $0xa,%esi
    5507:	48 8d 05 f2 66 00 00 	lea    0x66f2(%rip),%rax        # bc00 <__pmm_obj+0xa0>
    550e:	48 89 c7             	mov    %rax,%rdi
    5511:	e8 3a db ff ff       	call   3050 <__asan_register_globals@plt>
    5516:	5d                   	pop    %rbp
    5517:	c3                   	ret

0000000000005518 <cpu_current>:
    5518:	55                   	push   %rbp
    5519:	48 89 e5             	mov    %rsp,%rbp
    551c:	e8 9f db ff ff       	call   30c0 <pthread_self@plt>
    5521:	5d                   	pop    %rbp
    5522:	c3                   	ret

0000000000005523 <wrapper>:
    5523:	55                   	push   %rbp
    5524:	48 89 e5             	mov    %rsp,%rbp
    5527:	48 83 ec 20          	sub    $0x20,%rsp
    552b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    552f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    5533:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    5537:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    553b:	48 83 c0 10          	add    $0x10,%rax
    553f:	48 89 c2             	mov    %rax,%rdx
    5542:	48 c1 ea 03          	shr    $0x3,%rdx
    5546:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    554d:	0f b6 12             	movzbl (%rdx),%edx
    5550:	84 d2                	test   %dl,%dl
    5552:	74 08                	je     555c <wrapper+0x39>
    5554:	48 89 c7             	mov    %rax,%rdi
    5557:	e8 e4 db ff ff       	call   3140 <__asan_report_load8@plt>
    555c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5560:	48 8b 48 10          	mov    0x10(%rax),%rcx
    5564:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5568:	48 89 c2             	mov    %rax,%rdx
    556b:	48 89 d0             	mov    %rdx,%rax
    556e:	48 c1 e8 03          	shr    $0x3,%rax
    5572:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    5578:	0f b6 00             	movzbl (%rax),%eax
    557b:	84 c0                	test   %al,%al
    557d:	40 0f 95 c6          	setne  %sil
    5581:	3c 03                	cmp    $0x3,%al
    5583:	0f 9e c0             	setle  %al
    5586:	21 f0                	and    %esi,%eax
    5588:	84 c0                	test   %al,%al
    558a:	74 08                	je     5594 <wrapper+0x71>
    558c:	48 89 d7             	mov    %rdx,%rdi
    558f:	e8 fc da ff ff       	call   3090 <__asan_report_load4@plt>
    5594:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5598:	8b 00                	mov    (%rax),%eax
    559a:	89 c7                	mov    %eax,%edi
    559c:	ff d1                	call   *%rcx
    559e:	b8 00 00 00 00       	mov    $0x0,%eax
    55a3:	c9                   	leave
    55a4:	c3                   	ret

00000000000055a5 <create>:
    55a5:	55                   	push   %rbp
    55a6:	48 89 e5             	mov    %rsp,%rbp
    55a9:	48 83 ec 30          	sub    $0x30,%rsp
    55ad:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    55b1:	48 8b 15 c8 68 00 00 	mov    0x68c8(%rip),%rdx        # be80 <tptr>
    55b8:	48 8d 05 e1 85 00 00 	lea    0x85e1(%rip),%rax        # dba0 <tpool>
    55bf:	48 29 c2             	sub    %rax,%rdx
    55c2:	48 81 fa e8 05 00 00 	cmp    $0x5e8,%rdx
    55c9:	7e 2d                	jle    55f8 <create+0x53>
    55cb:	e8 20 db ff ff       	call   30f0 <__asan_handle_no_return@plt>
    55d0:	48 8d 05 09 39 00 00 	lea    0x3909(%rip),%rax        # 8ee0 <__PRETTY_FUNCTION__.2>
    55d7:	48 89 c1             	mov    %rax,%rcx
    55da:	ba 28 00 00 00       	mov    $0x28,%edx
    55df:	48 8d 05 3a 36 00 00 	lea    0x363a(%rip),%rax        # 8c20 <__PRETTY_FUNCTION__.0+0xc0>
    55e6:	48 89 c6             	mov    %rax,%rsi
    55e9:	48 8d 05 70 36 00 00 	lea    0x3670(%rip),%rax        # 8c60 <__PRETTY_FUNCTION__.0+0x100>
    55f0:	48 89 c7             	mov    %rax,%rdi
    55f3:	e8 a8 da ff ff       	call   30a0 <__assert_fail@plt>
    55f8:	48 8b 05 81 68 00 00 	mov    0x6881(%rip),%rax        # be80 <tptr>
    55ff:	48 8b 0d 7a 68 00 00 	mov    0x687a(%rip),%rcx        # be80 <tptr>
    5606:	48 8d 15 93 85 00 00 	lea    0x8593(%rip),%rdx        # dba0 <tpool>
    560d:	48 29 d1             	sub    %rdx,%rcx
    5610:	48 c1 f9 03          	sar    $0x3,%rcx
    5614:	48 ba ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rdx
    561b:	aa aa aa 
    561e:	48 0f af d1          	imul   %rcx,%rdx
    5622:	83 c2 01             	add    $0x1,%edx
    5625:	41 89 d0             	mov    %edx,%r8d
    5628:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
    562c:	48 89 c2             	mov    %rax,%rdx
    562f:	48 89 d1             	mov    %rdx,%rcx
    5632:	48 c1 e9 03          	shr    $0x3,%rcx
    5636:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    563d:	0f b6 09             	movzbl (%rcx),%ecx
    5640:	84 c9                	test   %cl,%cl
    5642:	40 0f 95 c6          	setne  %sil
    5646:	84 c9                	test   %cl,%cl
    5648:	0f 9e c1             	setle  %cl
    564b:	21 ce                	and    %ecx,%esi
    564d:	41 89 f1             	mov    %esi,%r9d
    5650:	b9 18 00 00 00       	mov    $0x18,%ecx
    5655:	48 83 e9 01          	sub    $0x1,%rcx
    5659:	48 8d 34 0a          	lea    (%rdx,%rcx,1),%rsi
    565d:	48 89 f1             	mov    %rsi,%rcx
    5660:	48 c1 e9 03          	shr    $0x3,%rcx
    5664:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    566b:	0f b6 09             	movzbl (%rcx),%ecx
    566e:	84 c9                	test   %cl,%cl
    5670:	41 0f 95 c2          	setne  %r10b
    5674:	83 e6 07             	and    $0x7,%esi
    5677:	40 38 ce             	cmp    %cl,%sil
    567a:	0f 9d c1             	setge  %cl
    567d:	44 21 d1             	and    %r10d,%ecx
    5680:	44 09 c9             	or     %r9d,%ecx
    5683:	84 c9                	test   %cl,%cl
    5685:	74 0d                	je     5694 <create+0xef>
    5687:	be 18 00 00 00       	mov    $0x18,%esi
    568c:	48 89 d7             	mov    %rdx,%rdi
    568f:	e8 dc da ff ff       	call   3170 <__asan_report_store_n@plt>
    5694:	66 0f ef c0          	pxor   %xmm0,%xmm0
    5698:	0f 11 00             	movups %xmm0,(%rax)
    569b:	66 0f d6 40 10       	movq   %xmm0,0x10(%rax)
    56a0:	48 89 c2             	mov    %rax,%rdx
    56a3:	48 89 d1             	mov    %rdx,%rcx
    56a6:	48 89 ca             	mov    %rcx,%rdx
    56a9:	48 c1 ea 03          	shr    $0x3,%rdx
    56ad:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    56b4:	0f b6 12             	movzbl (%rdx),%edx
    56b7:	84 d2                	test   %dl,%dl
    56b9:	40 0f 95 c6          	setne  %sil
    56bd:	80 fa 03             	cmp    $0x3,%dl
    56c0:	0f 9e c2             	setle  %dl
    56c3:	21 f2                	and    %esi,%edx
    56c5:	84 d2                	test   %dl,%dl
    56c7:	74 08                	je     56d1 <create+0x12c>
    56c9:	48 89 cf             	mov    %rcx,%rdi
    56cc:	e8 5f d9 ff ff       	call   3030 <__asan_report_store4@plt>
    56d1:	44 89 00             	mov    %r8d,(%rax)
    56d4:	48 8d 50 04          	lea    0x4(%rax),%rdx
    56d8:	48 89 d1             	mov    %rdx,%rcx
    56db:	48 c1 e9 03          	shr    $0x3,%rcx
    56df:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    56e6:	0f b6 09             	movzbl (%rcx),%ecx
    56e9:	84 c9                	test   %cl,%cl
    56eb:	41 0f 95 c0          	setne  %r8b
    56ef:	48 89 d6             	mov    %rdx,%rsi
    56f2:	83 e6 07             	and    $0x7,%esi
    56f5:	83 c6 03             	add    $0x3,%esi
    56f8:	40 38 ce             	cmp    %cl,%sil
    56fb:	0f 9d c1             	setge  %cl
    56fe:	44 21 c1             	and    %r8d,%ecx
    5701:	84 c9                	test   %cl,%cl
    5703:	74 08                	je     570d <create+0x168>
    5705:	48 89 d7             	mov    %rdx,%rdi
    5708:	e8 23 d9 ff ff       	call   3030 <__asan_report_store4@plt>
    570d:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%rax)
    5714:	48 8d 50 10          	lea    0x10(%rax),%rdx
    5718:	48 89 d1             	mov    %rdx,%rcx
    571b:	48 c1 e9 03          	shr    $0x3,%rcx
    571f:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    5726:	0f b6 09             	movzbl (%rcx),%ecx
    5729:	84 c9                	test   %cl,%cl
    572b:	74 08                	je     5735 <create+0x190>
    572d:	48 89 d7             	mov    %rdx,%rdi
    5730:	e8 9b d9 ff ff       	call   30d0 <__asan_report_store8@plt>
    5735:	48 89 78 10          	mov    %rdi,0x10(%rax)
    5739:	48 8b 05 40 67 00 00 	mov    0x6740(%rip),%rax        # be80 <tptr>
    5740:	48 8b 15 39 67 00 00 	mov    0x6739(%rip),%rdx        # be80 <tptr>
    5747:	48 8d 7a 08          	lea    0x8(%rdx),%rdi
    574b:	48 89 c1             	mov    %rax,%rcx
    574e:	48 8d 05 ce fd ff ff 	lea    -0x232(%rip),%rax        # 5523 <wrapper>
    5755:	48 89 c2             	mov    %rax,%rdx
    5758:	be 00 00 00 00       	mov    $0x0,%esi
    575d:	e8 0e d9 ff ff       	call   3070 <pthread_create@plt>
    5762:	48 8b 05 17 67 00 00 	mov    0x6717(%rip),%rax        # be80 <tptr>
    5769:	48 83 c0 18          	add    $0x18,%rax
    576d:	48 89 05 0c 67 00 00 	mov    %rax,0x670c(%rip)        # be80 <tptr>
    5774:	90                   	nop
    5775:	c9                   	leave
    5776:	c3                   	ret

0000000000005777 <join>:
    5777:	55                   	push   %rbp
    5778:	48 89 e5             	mov    %rsp,%rbp
    577b:	48 83 ec 10          	sub    $0x10,%rsp
    577f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    5786:	e9 f0 00 00 00       	jmp    587b <join+0x104>
    578b:	8b 45 f4             	mov    -0xc(%rbp),%eax
    578e:	48 63 d0             	movslq %eax,%rdx
    5791:	48 89 d0             	mov    %rdx,%rax
    5794:	48 01 c0             	add    %rax,%rax
    5797:	48 01 d0             	add    %rdx,%rax
    579a:	48 c1 e0 03          	shl    $0x3,%rax
    579e:	48 8d 15 fb 83 00 00 	lea    0x83fb(%rip),%rdx        # dba0 <tpool>
    57a5:	48 01 d0             	add    %rdx,%rax
    57a8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    57ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    57b0:	48 83 c0 04          	add    $0x4,%rax
    57b4:	48 89 c2             	mov    %rax,%rdx
    57b7:	48 c1 ea 03          	shr    $0x3,%rdx
    57bb:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    57c2:	0f b6 12             	movzbl (%rdx),%edx
    57c5:	84 d2                	test   %dl,%dl
    57c7:	40 0f 95 c6          	setne  %sil
    57cb:	48 89 c1             	mov    %rax,%rcx
    57ce:	83 e1 07             	and    $0x7,%ecx
    57d1:	83 c1 03             	add    $0x3,%ecx
    57d4:	38 d1                	cmp    %dl,%cl
    57d6:	0f 9d c2             	setge  %dl
    57d9:	21 f2                	and    %esi,%edx
    57db:	84 d2                	test   %dl,%dl
    57dd:	74 08                	je     57e7 <join+0x70>
    57df:	48 89 c7             	mov    %rax,%rdi
    57e2:	e8 a9 d8 ff ff       	call   3090 <__asan_report_load4@plt>
    57e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    57eb:	8b 40 04             	mov    0x4(%rax),%eax
    57ee:	83 f8 01             	cmp    $0x1,%eax
    57f1:	0f 85 80 00 00 00    	jne    5877 <join+0x100>
    57f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    57fb:	48 83 c0 08          	add    $0x8,%rax
    57ff:	48 89 c2             	mov    %rax,%rdx
    5802:	48 c1 ea 03          	shr    $0x3,%rdx
    5806:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    580d:	0f b6 12             	movzbl (%rdx),%edx
    5810:	84 d2                	test   %dl,%dl
    5812:	74 08                	je     581c <join+0xa5>
    5814:	48 89 c7             	mov    %rax,%rdi
    5817:	e8 24 d9 ff ff       	call   3140 <__asan_report_load8@plt>
    581c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5820:	48 8b 40 08          	mov    0x8(%rax),%rax
    5824:	be 00 00 00 00       	mov    $0x0,%esi
    5829:	48 89 c7             	mov    %rax,%rdi
    582c:	e8 2f d9 ff ff       	call   3160 <pthread_join@plt>
    5831:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5835:	48 83 c0 04          	add    $0x4,%rax
    5839:	48 89 c2             	mov    %rax,%rdx
    583c:	48 c1 ea 03          	shr    $0x3,%rdx
    5840:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    5847:	0f b6 12             	movzbl (%rdx),%edx
    584a:	84 d2                	test   %dl,%dl
    584c:	40 0f 95 c6          	setne  %sil
    5850:	48 89 c1             	mov    %rax,%rcx
    5853:	83 e1 07             	and    $0x7,%ecx
    5856:	83 c1 03             	add    $0x3,%ecx
    5859:	38 d1                	cmp    %dl,%cl
    585b:	0f 9d c2             	setge  %dl
    585e:	21 f2                	and    %esi,%edx
    5860:	84 d2                	test   %dl,%dl
    5862:	74 08                	je     586c <join+0xf5>
    5864:	48 89 c7             	mov    %rax,%rdi
    5867:	e8 c4 d7 ff ff       	call   3030 <__asan_report_store4@plt>
    586c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5870:	c7 40 04 02 00 00 00 	movl   $0x2,0x4(%rax)
    5877:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    587b:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%rbp)
    587f:	0f 8e 06 ff ff ff    	jle    578b <join+0x14>
    5885:	90                   	nop
    5886:	90                   	nop
    5887:	c9                   	leave
    5888:	c3                   	ret

0000000000005889 <cleanup>:
    5889:	55                   	push   %rbp
    588a:	48 89 e5             	mov    %rsp,%rbp
    588d:	b8 00 00 00 00       	mov    $0x0,%eax
    5892:	e8 e0 fe ff ff       	call   5777 <join>
    5897:	90                   	nop
    5898:	5d                   	pop    %rbp
    5899:	c3                   	ret

000000000000589a <os_init>:
    589a:	55                   	push   %rbp
    589b:	48 89 e5             	mov    %rsp,%rbp
    589e:	48 8d 05 7b 62 00 00 	lea    0x627b(%rip),%rax        # bb20 <pmm>
    58a5:	48 89 c2             	mov    %rax,%rdx
    58a8:	48 c1 ea 03          	shr    $0x3,%rdx
    58ac:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    58b3:	0f b6 12             	movzbl (%rdx),%edx
    58b6:	84 d2                	test   %dl,%dl
    58b8:	74 08                	je     58c2 <os_init+0x28>
    58ba:	48 89 c7             	mov    %rax,%rdi
    58bd:	e8 7e d8 ff ff       	call   3140 <__asan_report_load8@plt>
    58c2:	48 8b 05 57 62 00 00 	mov    0x6257(%rip),%rax        # bb20 <pmm>
    58c9:	48 89 c2             	mov    %rax,%rdx
    58cc:	48 89 d1             	mov    %rdx,%rcx
    58cf:	48 c1 e9 03          	shr    $0x3,%rcx
    58d3:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    58da:	0f b6 09             	movzbl (%rcx),%ecx
    58dd:	84 c9                	test   %cl,%cl
    58df:	74 08                	je     58e9 <os_init+0x4f>
    58e1:	48 89 d7             	mov    %rdx,%rdi
    58e4:	e8 57 d8 ff ff       	call   3140 <__asan_report_load8@plt>
    58e9:	48 8b 10             	mov    (%rax),%rdx
    58ec:	b8 00 00 00 00       	mov    $0x0,%eax
    58f1:	ff d2                	call   *%rdx
    58f3:	90                   	nop
    58f4:	5d                   	pop    %rbp
    58f5:	c3                   	ret

00000000000058f6 <test_alloc>:
    58f6:	55                   	push   %rbp
    58f7:	48 89 e5             	mov    %rsp,%rbp
    58fa:	48 83 ec 20          	sub    $0x20,%rsp
    58fe:	89 7d ec             	mov    %edi,-0x14(%rbp)
    5901:	48 8d 05 18 62 00 00 	lea    0x6218(%rip),%rax        # bb20 <pmm>
    5908:	48 89 c2             	mov    %rax,%rdx
    590b:	48 c1 ea 03          	shr    $0x3,%rdx
    590f:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    5916:	0f b6 12             	movzbl (%rdx),%edx
    5919:	84 d2                	test   %dl,%dl
    591b:	74 08                	je     5925 <test_alloc+0x2f>
    591d:	48 89 c7             	mov    %rax,%rdi
    5920:	e8 1b d8 ff ff       	call   3140 <__asan_report_load8@plt>
    5925:	48 8b 05 f4 61 00 00 	mov    0x61f4(%rip),%rax        # bb20 <pmm>
    592c:	48 8d 50 08          	lea    0x8(%rax),%rdx
    5930:	48 89 d1             	mov    %rdx,%rcx
    5933:	48 c1 e9 03          	shr    $0x3,%rcx
    5937:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    593e:	0f b6 09             	movzbl (%rcx),%ecx
    5941:	84 c9                	test   %cl,%cl
    5943:	74 08                	je     594d <test_alloc+0x57>
    5945:	48 89 d7             	mov    %rdx,%rdi
    5948:	e8 f3 d7 ff ff       	call   3140 <__asan_report_load8@plt>
    594d:	48 8b 50 08          	mov    0x8(%rax),%rdx
    5951:	8b 45 ec             	mov    -0x14(%rbp),%eax
    5954:	48 98                	cltq
    5956:	48 89 c7             	mov    %rax,%rdi
    5959:	ff d2                	call   *%rdx
    595b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    595f:	8b 4d ec             	mov    -0x14(%rbp),%ecx
    5962:	8b 55 ec             	mov    -0x14(%rbp),%edx
    5965:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5969:	48 89 c6             	mov    %rax,%rsi
    596c:	48 8d 05 2d 33 00 00 	lea    0x332d(%rip),%rax        # 8ca0 <__PRETTY_FUNCTION__.0+0x140>
    5973:	48 89 c7             	mov    %rax,%rdi
    5976:	b8 00 00 00 00       	mov    $0x0,%eax
    597b:	e8 c0 d6 ff ff       	call   3040 <printf@plt>
    5980:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
    5984:	0f 94 c0             	sete   %al
    5987:	0f b6 c0             	movzbl %al,%eax
    598a:	0b 45 ec             	or     -0x14(%rbp),%eax
    598d:	85 c0                	test   %eax,%eax
    598f:	75 55                	jne    59e6 <test_alloc+0xf0>
    5991:	8b 45 ec             	mov    -0x14(%rbp),%eax
    5994:	83 e8 01             	sub    $0x1,%eax
    5997:	48 63 d0             	movslq %eax,%rdx
    599a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    599e:	48 89 d1             	mov    %rdx,%rcx
    59a1:	48 09 c1             	or     %rax,%rcx
    59a4:	8b 45 ec             	mov    -0x14(%rbp),%eax
    59a7:	83 e8 01             	sub    $0x1,%eax
    59aa:	48 63 d0             	movslq %eax,%rdx
    59ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    59b1:	48 01 d0             	add    %rdx,%rax
    59b4:	48 39 c1             	cmp    %rax,%rcx
    59b7:	74 2d                	je     59e6 <test_alloc+0xf0>
    59b9:	e8 32 d7 ff ff       	call   30f0 <__asan_handle_no_return@plt>
    59be:	48 8d 05 5b 35 00 00 	lea    0x355b(%rip),%rax        # 8f20 <__PRETTY_FUNCTION__.1>
    59c5:	48 89 c1             	mov    %rax,%rcx
    59c8:	ba 0f 00 00 00       	mov    $0xf,%edx
    59cd:	48 8d 05 2c 33 00 00 	lea    0x332c(%rip),%rax        # 8d00 <__PRETTY_FUNCTION__.0+0x1a0>
    59d4:	48 89 c6             	mov    %rax,%rsi
    59d7:	48 8d 05 62 33 00 00 	lea    0x3362(%rip),%rax        # 8d40 <__PRETTY_FUNCTION__.0+0x1e0>
    59de:	48 89 c7             	mov    %rax,%rdi
    59e1:	e8 ba d6 ff ff       	call   30a0 <__assert_fail@plt>
    59e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    59ea:	c9                   	leave
    59eb:	c3                   	ret

00000000000059ec <test_free>:
    59ec:	55                   	push   %rbp
    59ed:	48 89 e5             	mov    %rsp,%rbp
    59f0:	48 83 ec 10          	sub    $0x10,%rsp
    59f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    59f8:	b8 00 00 00 00       	mov    $0x0,%eax
    59fd:	e8 16 fb ff ff       	call   5518 <cpu_current>
    5a02:	89 c1                	mov    %eax,%ecx
    5a04:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5a08:	48 89 c2             	mov    %rax,%rdx
    5a0b:	89 ce                	mov    %ecx,%esi
    5a0d:	48 8d 05 cc 33 00 00 	lea    0x33cc(%rip),%rax        # 8de0 <__PRETTY_FUNCTION__.0+0x280>
    5a14:	48 89 c7             	mov    %rax,%rdi
    5a17:	b8 00 00 00 00       	mov    $0x0,%eax
    5a1c:	e8 1f d6 ff ff       	call   3040 <printf@plt>
    5a21:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    5a26:	75 2d                	jne    5a55 <test_free+0x69>
    5a28:	e8 c3 d6 ff ff       	call   30f0 <__asan_handle_no_return@plt>
    5a2d:	48 8d 05 2c 35 00 00 	lea    0x352c(%rip),%rax        # 8f60 <__PRETTY_FUNCTION__.0>
    5a34:	48 89 c1             	mov    %rax,%rcx
    5a37:	ba 15 00 00 00       	mov    $0x15,%edx
    5a3c:	48 8d 05 bd 32 00 00 	lea    0x32bd(%rip),%rax        # 8d00 <__PRETTY_FUNCTION__.0+0x1a0>
    5a43:	48 89 c6             	mov    %rax,%rsi
    5a46:	48 8d 05 d3 33 00 00 	lea    0x33d3(%rip),%rax        # 8e20 <__PRETTY_FUNCTION__.0+0x2c0>
    5a4d:	48 89 c7             	mov    %rax,%rdi
    5a50:	e8 4b d6 ff ff       	call   30a0 <__assert_fail@plt>
    5a55:	48 8d 05 c4 60 00 00 	lea    0x60c4(%rip),%rax        # bb20 <pmm>
    5a5c:	48 89 c2             	mov    %rax,%rdx
    5a5f:	48 c1 ea 03          	shr    $0x3,%rdx
    5a63:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    5a6a:	0f b6 12             	movzbl (%rdx),%edx
    5a6d:	84 d2                	test   %dl,%dl
    5a6f:	74 08                	je     5a79 <test_free+0x8d>
    5a71:	48 89 c7             	mov    %rax,%rdi
    5a74:	e8 c7 d6 ff ff       	call   3140 <__asan_report_load8@plt>
    5a79:	48 8b 05 a0 60 00 00 	mov    0x60a0(%rip),%rax        # bb20 <pmm>
    5a80:	48 8d 50 10          	lea    0x10(%rax),%rdx
    5a84:	48 89 d1             	mov    %rdx,%rcx
    5a87:	48 c1 e9 03          	shr    $0x3,%rcx
    5a8b:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    5a92:	0f b6 09             	movzbl (%rcx),%ecx
    5a95:	84 c9                	test   %cl,%cl
    5a97:	74 08                	je     5aa1 <test_free+0xb5>
    5a99:	48 89 d7             	mov    %rdx,%rdi
    5a9c:	e8 9f d6 ff ff       	call   3140 <__asan_report_load8@plt>
    5aa1:	48 8b 50 10          	mov    0x10(%rax),%rdx
    5aa5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5aa9:	48 89 c7             	mov    %rax,%rdi
    5aac:	ff d2                	call   *%rdx
    5aae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5ab2:	48 89 c6             	mov    %rax,%rsi
    5ab5:	48 8d 05 a4 33 00 00 	lea    0x33a4(%rip),%rax        # 8e60 <__PRETTY_FUNCTION__.0+0x300>
    5abc:	48 89 c7             	mov    %rax,%rdi
    5abf:	b8 00 00 00 00       	mov    $0x0,%eax
    5ac4:	e8 77 d5 ff ff       	call   3040 <printf@plt>
    5ac9:	90                   	nop
    5aca:	c9                   	leave
    5acb:	c3                   	ret

0000000000005acc <os_run>:
    5acc:	55                   	push   %rbp
    5acd:	48 89 e5             	mov    %rsp,%rbp
    5ad0:	48 8d 05 c9 33 00 00 	lea    0x33c9(%rip),%rax        # 8ea0 <__PRETTY_FUNCTION__.0+0x340>
    5ad7:	48 89 c7             	mov    %rax,%rdi
    5ada:	e8 a1 d5 ff ff       	call   3080 <puts@plt>
    5adf:	eb fe                	jmp    5adf <os_run+0x13>

0000000000005ae1 <_sub_D_00099_0>:
    5ae1:	55                   	push   %rbp
    5ae2:	48 89 e5             	mov    %rsp,%rbp
    5ae5:	be 11 00 00 00       	mov    $0x11,%esi
    5aea:	48 8d 05 cf 64 00 00 	lea    0x64cf(%rip),%rax        # bfc0 <__os_obj+0xc0>
    5af1:	48 89 c7             	mov    %rax,%rdi
    5af4:	e8 e7 d5 ff ff       	call   30e0 <__asan_unregister_globals@plt>
    5af9:	5d                   	pop    %rbp
    5afa:	c3                   	ret

0000000000005afb <_sub_I_00099_1>:
    5afb:	55                   	push   %rbp
    5afc:	48 89 e5             	mov    %rsp,%rbp
    5aff:	e8 fc d5 ff ff       	call   3100 <__asan_init@plt>
    5b04:	e8 47 d6 ff ff       	call   3150 <__asan_version_mismatch_check_v8@plt>
    5b09:	be 11 00 00 00       	mov    $0x11,%esi
    5b0e:	48 8d 05 ab 64 00 00 	lea    0x64ab(%rip),%rax        # bfc0 <__os_obj+0xc0>
    5b15:	48 89 c7             	mov    %rax,%rdi
    5b18:	e8 33 d5 ff ff       	call   3050 <__asan_register_globals@plt>
    5b1d:	5d                   	pop    %rbp
    5b1e:	c3                   	ret

0000000000005b1f <cpu_current>:
    5b1f:	55                   	push   %rbp
    5b20:	48 89 e5             	mov    %rsp,%rbp
    5b23:	e8 98 d5 ff ff       	call   30c0 <pthread_self@plt>
    5b28:	5d                   	pop    %rbp
    5b29:	c3                   	ret

0000000000005b2a <cpu_count>:
    5b2a:	55                   	push   %rbp
    5b2b:	48 89 e5             	mov    %rsp,%rbp
    5b2e:	48 8b 15 cb 68 00 00 	mov    0x68cb(%rip),%rdx        # c400 <tptr>
    5b35:	48 8d 05 e4 86 00 00 	lea    0x86e4(%rip),%rax        # e220 <tpool>
    5b3c:	48 29 c2             	sub    %rax,%rdx
    5b3f:	48 c1 fa 03          	sar    $0x3,%rdx
    5b43:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
    5b4a:	aa aa aa 
    5b4d:	48 0f af c2          	imul   %rdx,%rax
    5b51:	83 c0 01             	add    $0x1,%eax
    5b54:	5d                   	pop    %rbp
    5b55:	c3                   	ret

0000000000005b56 <wrapper>:
    5b56:	55                   	push   %rbp
    5b57:	48 89 e5             	mov    %rsp,%rbp
    5b5a:	48 83 ec 20          	sub    $0x20,%rsp
    5b5e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    5b62:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    5b66:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    5b6a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5b6e:	48 83 c0 10          	add    $0x10,%rax
    5b72:	48 89 c2             	mov    %rax,%rdx
    5b75:	48 c1 ea 03          	shr    $0x3,%rdx
    5b79:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    5b80:	0f b6 12             	movzbl (%rdx),%edx
    5b83:	84 d2                	test   %dl,%dl
    5b85:	74 08                	je     5b8f <wrapper+0x39>
    5b87:	48 89 c7             	mov    %rax,%rdi
    5b8a:	e8 b1 d5 ff ff       	call   3140 <__asan_report_load8@plt>
    5b8f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5b93:	48 8b 48 10          	mov    0x10(%rax),%rcx
    5b97:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5b9b:	48 89 c2             	mov    %rax,%rdx
    5b9e:	48 89 d0             	mov    %rdx,%rax
    5ba1:	48 c1 e8 03          	shr    $0x3,%rax
    5ba5:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    5bab:	0f b6 00             	movzbl (%rax),%eax
    5bae:	84 c0                	test   %al,%al
    5bb0:	40 0f 95 c6          	setne  %sil
    5bb4:	3c 03                	cmp    $0x3,%al
    5bb6:	0f 9e c0             	setle  %al
    5bb9:	21 f0                	and    %esi,%eax
    5bbb:	84 c0                	test   %al,%al
    5bbd:	74 08                	je     5bc7 <wrapper+0x71>
    5bbf:	48 89 d7             	mov    %rdx,%rdi
    5bc2:	e8 c9 d4 ff ff       	call   3090 <__asan_report_load4@plt>
    5bc7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5bcb:	8b 00                	mov    (%rax),%eax
    5bcd:	89 c7                	mov    %eax,%edi
    5bcf:	ff d1                	call   *%rcx
    5bd1:	b8 00 00 00 00       	mov    $0x0,%eax
    5bd6:	c9                   	leave
    5bd7:	c3                   	ret

0000000000005bd8 <create>:
    5bd8:	55                   	push   %rbp
    5bd9:	48 89 e5             	mov    %rsp,%rbp
    5bdc:	48 83 ec 30          	sub    $0x30,%rsp
    5be0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    5be4:	48 8b 15 15 68 00 00 	mov    0x6815(%rip),%rdx        # c400 <tptr>
    5beb:	48 8d 05 2e 86 00 00 	lea    0x862e(%rip),%rax        # e220 <tpool>
    5bf2:	48 29 c2             	sub    %rax,%rdx
    5bf5:	48 81 fa e8 05 00 00 	cmp    $0x5e8,%rdx
    5bfc:	7e 2d                	jle    5c2b <create+0x53>
    5bfe:	e8 ed d4 ff ff       	call   30f0 <__asan_handle_no_return@plt>
    5c03:	48 8d 05 16 36 00 00 	lea    0x3616(%rip),%rax        # 9220 <__PRETTY_FUNCTION__.3>
    5c0a:	48 89 c1             	mov    %rax,%rcx
    5c0d:	ba 28 00 00 00       	mov    $0x28,%edx
    5c12:	48 8d 05 07 34 00 00 	lea    0x3407(%rip),%rax        # 9020 <__PRETTY_FUNCTION__.0+0xc0>
    5c19:	48 89 c6             	mov    %rax,%rsi
    5c1c:	48 8d 05 3d 34 00 00 	lea    0x343d(%rip),%rax        # 9060 <__PRETTY_FUNCTION__.0+0x100>
    5c23:	48 89 c7             	mov    %rax,%rdi
    5c26:	e8 75 d4 ff ff       	call   30a0 <__assert_fail@plt>
    5c2b:	48 8b 05 ce 67 00 00 	mov    0x67ce(%rip),%rax        # c400 <tptr>
    5c32:	48 8b 0d c7 67 00 00 	mov    0x67c7(%rip),%rcx        # c400 <tptr>
    5c39:	48 8d 15 e0 85 00 00 	lea    0x85e0(%rip),%rdx        # e220 <tpool>
    5c40:	48 29 d1             	sub    %rdx,%rcx
    5c43:	48 c1 f9 03          	sar    $0x3,%rcx
    5c47:	48 ba ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rdx
    5c4e:	aa aa aa 
    5c51:	48 0f af d1          	imul   %rcx,%rdx
    5c55:	83 c2 01             	add    $0x1,%edx
    5c58:	41 89 d0             	mov    %edx,%r8d
    5c5b:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
    5c5f:	48 89 c2             	mov    %rax,%rdx
    5c62:	48 89 d1             	mov    %rdx,%rcx
    5c65:	48 c1 e9 03          	shr    $0x3,%rcx
    5c69:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    5c70:	0f b6 09             	movzbl (%rcx),%ecx
    5c73:	84 c9                	test   %cl,%cl
    5c75:	40 0f 95 c6          	setne  %sil
    5c79:	84 c9                	test   %cl,%cl
    5c7b:	0f 9e c1             	setle  %cl
    5c7e:	21 ce                	and    %ecx,%esi
    5c80:	41 89 f1             	mov    %esi,%r9d
    5c83:	b9 18 00 00 00       	mov    $0x18,%ecx
    5c88:	48 83 e9 01          	sub    $0x1,%rcx
    5c8c:	48 8d 34 0a          	lea    (%rdx,%rcx,1),%rsi
    5c90:	48 89 f1             	mov    %rsi,%rcx
    5c93:	48 c1 e9 03          	shr    $0x3,%rcx
    5c97:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    5c9e:	0f b6 09             	movzbl (%rcx),%ecx
    5ca1:	84 c9                	test   %cl,%cl
    5ca3:	41 0f 95 c2          	setne  %r10b
    5ca7:	83 e6 07             	and    $0x7,%esi
    5caa:	40 38 ce             	cmp    %cl,%sil
    5cad:	0f 9d c1             	setge  %cl
    5cb0:	44 21 d1             	and    %r10d,%ecx
    5cb3:	44 09 c9             	or     %r9d,%ecx
    5cb6:	84 c9                	test   %cl,%cl
    5cb8:	74 0d                	je     5cc7 <create+0xef>
    5cba:	be 18 00 00 00       	mov    $0x18,%esi
    5cbf:	48 89 d7             	mov    %rdx,%rdi
    5cc2:	e8 a9 d4 ff ff       	call   3170 <__asan_report_store_n@plt>
    5cc7:	66 0f ef c0          	pxor   %xmm0,%xmm0
    5ccb:	0f 11 00             	movups %xmm0,(%rax)
    5cce:	66 0f d6 40 10       	movq   %xmm0,0x10(%rax)
    5cd3:	48 89 c2             	mov    %rax,%rdx
    5cd6:	48 89 d1             	mov    %rdx,%rcx
    5cd9:	48 89 ca             	mov    %rcx,%rdx
    5cdc:	48 c1 ea 03          	shr    $0x3,%rdx
    5ce0:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    5ce7:	0f b6 12             	movzbl (%rdx),%edx
    5cea:	84 d2                	test   %dl,%dl
    5cec:	40 0f 95 c6          	setne  %sil
    5cf0:	80 fa 03             	cmp    $0x3,%dl
    5cf3:	0f 9e c2             	setle  %dl
    5cf6:	21 f2                	and    %esi,%edx
    5cf8:	84 d2                	test   %dl,%dl
    5cfa:	74 08                	je     5d04 <create+0x12c>
    5cfc:	48 89 cf             	mov    %rcx,%rdi
    5cff:	e8 2c d3 ff ff       	call   3030 <__asan_report_store4@plt>
    5d04:	44 89 00             	mov    %r8d,(%rax)
    5d07:	48 8d 50 04          	lea    0x4(%rax),%rdx
    5d0b:	48 89 d1             	mov    %rdx,%rcx
    5d0e:	48 c1 e9 03          	shr    $0x3,%rcx
    5d12:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    5d19:	0f b6 09             	movzbl (%rcx),%ecx
    5d1c:	84 c9                	test   %cl,%cl
    5d1e:	41 0f 95 c0          	setne  %r8b
    5d22:	48 89 d6             	mov    %rdx,%rsi
    5d25:	83 e6 07             	and    $0x7,%esi
    5d28:	83 c6 03             	add    $0x3,%esi
    5d2b:	40 38 ce             	cmp    %cl,%sil
    5d2e:	0f 9d c1             	setge  %cl
    5d31:	44 21 c1             	and    %r8d,%ecx
    5d34:	84 c9                	test   %cl,%cl
    5d36:	74 08                	je     5d40 <create+0x168>
    5d38:	48 89 d7             	mov    %rdx,%rdi
    5d3b:	e8 f0 d2 ff ff       	call   3030 <__asan_report_store4@plt>
    5d40:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%rax)
    5d47:	48 8d 50 10          	lea    0x10(%rax),%rdx
    5d4b:	48 89 d1             	mov    %rdx,%rcx
    5d4e:	48 c1 e9 03          	shr    $0x3,%rcx
    5d52:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    5d59:	0f b6 09             	movzbl (%rcx),%ecx
    5d5c:	84 c9                	test   %cl,%cl
    5d5e:	74 08                	je     5d68 <create+0x190>
    5d60:	48 89 d7             	mov    %rdx,%rdi
    5d63:	e8 68 d3 ff ff       	call   30d0 <__asan_report_store8@plt>
    5d68:	48 89 78 10          	mov    %rdi,0x10(%rax)
    5d6c:	48 8b 05 8d 66 00 00 	mov    0x668d(%rip),%rax        # c400 <tptr>
    5d73:	48 8b 15 86 66 00 00 	mov    0x6686(%rip),%rdx        # c400 <tptr>
    5d7a:	48 8d 7a 08          	lea    0x8(%rdx),%rdi
    5d7e:	48 89 c1             	mov    %rax,%rcx
    5d81:	48 8d 05 ce fd ff ff 	lea    -0x232(%rip),%rax        # 5b56 <wrapper>
    5d88:	48 89 c2             	mov    %rax,%rdx
    5d8b:	be 00 00 00 00       	mov    $0x0,%esi
    5d90:	e8 db d2 ff ff       	call   3070 <pthread_create@plt>
    5d95:	48 8b 05 64 66 00 00 	mov    0x6664(%rip),%rax        # c400 <tptr>
    5d9c:	48 83 c0 18          	add    $0x18,%rax
    5da0:	48 89 05 59 66 00 00 	mov    %rax,0x6659(%rip)        # c400 <tptr>
    5da7:	90                   	nop
    5da8:	c9                   	leave
    5da9:	c3                   	ret

0000000000005daa <join>:
    5daa:	55                   	push   %rbp
    5dab:	48 89 e5             	mov    %rsp,%rbp
    5dae:	48 83 ec 10          	sub    $0x10,%rsp
    5db2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    5db9:	e9 f0 00 00 00       	jmp    5eae <join+0x104>
    5dbe:	8b 45 f4             	mov    -0xc(%rbp),%eax
    5dc1:	48 63 d0             	movslq %eax,%rdx
    5dc4:	48 89 d0             	mov    %rdx,%rax
    5dc7:	48 01 c0             	add    %rax,%rax
    5dca:	48 01 d0             	add    %rdx,%rax
    5dcd:	48 c1 e0 03          	shl    $0x3,%rax
    5dd1:	48 8d 15 48 84 00 00 	lea    0x8448(%rip),%rdx        # e220 <tpool>
    5dd8:	48 01 d0             	add    %rdx,%rax
    5ddb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    5ddf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5de3:	48 83 c0 04          	add    $0x4,%rax
    5de7:	48 89 c2             	mov    %rax,%rdx
    5dea:	48 c1 ea 03          	shr    $0x3,%rdx
    5dee:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    5df5:	0f b6 12             	movzbl (%rdx),%edx
    5df8:	84 d2                	test   %dl,%dl
    5dfa:	40 0f 95 c6          	setne  %sil
    5dfe:	48 89 c1             	mov    %rax,%rcx
    5e01:	83 e1 07             	and    $0x7,%ecx
    5e04:	83 c1 03             	add    $0x3,%ecx
    5e07:	38 d1                	cmp    %dl,%cl
    5e09:	0f 9d c2             	setge  %dl
    5e0c:	21 f2                	and    %esi,%edx
    5e0e:	84 d2                	test   %dl,%dl
    5e10:	74 08                	je     5e1a <join+0x70>
    5e12:	48 89 c7             	mov    %rax,%rdi
    5e15:	e8 76 d2 ff ff       	call   3090 <__asan_report_load4@plt>
    5e1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5e1e:	8b 40 04             	mov    0x4(%rax),%eax
    5e21:	83 f8 01             	cmp    $0x1,%eax
    5e24:	0f 85 80 00 00 00    	jne    5eaa <join+0x100>
    5e2a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5e2e:	48 83 c0 08          	add    $0x8,%rax
    5e32:	48 89 c2             	mov    %rax,%rdx
    5e35:	48 c1 ea 03          	shr    $0x3,%rdx
    5e39:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    5e40:	0f b6 12             	movzbl (%rdx),%edx
    5e43:	84 d2                	test   %dl,%dl
    5e45:	74 08                	je     5e4f <join+0xa5>
    5e47:	48 89 c7             	mov    %rax,%rdi
    5e4a:	e8 f1 d2 ff ff       	call   3140 <__asan_report_load8@plt>
    5e4f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5e53:	48 8b 40 08          	mov    0x8(%rax),%rax
    5e57:	be 00 00 00 00       	mov    $0x0,%esi
    5e5c:	48 89 c7             	mov    %rax,%rdi
    5e5f:	e8 fc d2 ff ff       	call   3160 <pthread_join@plt>
    5e64:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5e68:	48 83 c0 04          	add    $0x4,%rax
    5e6c:	48 89 c2             	mov    %rax,%rdx
    5e6f:	48 c1 ea 03          	shr    $0x3,%rdx
    5e73:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    5e7a:	0f b6 12             	movzbl (%rdx),%edx
    5e7d:	84 d2                	test   %dl,%dl
    5e7f:	40 0f 95 c6          	setne  %sil
    5e83:	48 89 c1             	mov    %rax,%rcx
    5e86:	83 e1 07             	and    $0x7,%ecx
    5e89:	83 c1 03             	add    $0x3,%ecx
    5e8c:	38 d1                	cmp    %dl,%cl
    5e8e:	0f 9d c2             	setge  %dl
    5e91:	21 f2                	and    %esi,%edx
    5e93:	84 d2                	test   %dl,%dl
    5e95:	74 08                	je     5e9f <join+0xf5>
    5e97:	48 89 c7             	mov    %rax,%rdi
    5e9a:	e8 91 d1 ff ff       	call   3030 <__asan_report_store4@plt>
    5e9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5ea3:	c7 40 04 02 00 00 00 	movl   $0x2,0x4(%rax)
    5eaa:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    5eae:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%rbp)
    5eb2:	0f 8e 06 ff ff ff    	jle    5dbe <join+0x14>
    5eb8:	90                   	nop
    5eb9:	90                   	nop
    5eba:	c9                   	leave
    5ebb:	c3                   	ret

0000000000005ebc <cleanup>:
    5ebc:	55                   	push   %rbp
    5ebd:	48 89 e5             	mov    %rsp,%rbp
    5ec0:	b8 00 00 00 00       	mov    $0x0,%eax
    5ec5:	e8 e0 fe ff ff       	call   5daa <join>
    5eca:	90                   	nop
    5ecb:	5d                   	pop    %rbp
    5ecc:	c3                   	ret

0000000000005ecd <atomic_xchg>:
    5ecd:	55                   	push   %rbp
    5ece:	48 89 e5             	mov    %rsp,%rbp
    5ed1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    5ed5:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    5ed8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    5edc:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    5edf:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    5ee3:	f0 87 02             	lock xchg %eax,(%rdx)
    5ee6:	89 45 fc             	mov    %eax,-0x4(%rbp)
    5ee9:	8b 45 fc             	mov    -0x4(%rbp),%eax
    5eec:	5d                   	pop    %rbp
    5eed:	c3                   	ret

0000000000005eee <spin_lock>:
    5eee:	55                   	push   %rbp
    5eef:	48 89 e5             	mov    %rsp,%rbp
    5ef2:	48 83 ec 18          	sub    $0x18,%rsp
    5ef6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    5efa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    5efe:	be 01 00 00 00       	mov    $0x1,%esi
    5f03:	48 89 c7             	mov    %rax,%rdi
    5f06:	e8 c2 ff ff ff       	call   5ecd <atomic_xchg>
    5f0b:	48 98                	cltq
    5f0d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    5f11:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    5f16:	74 02                	je     5f1a <spin_lock+0x2c>
    5f18:	eb e0                	jmp    5efa <spin_lock+0xc>
    5f1a:	90                   	nop
    5f1b:	90                   	nop
    5f1c:	c9                   	leave
    5f1d:	c3                   	ret

0000000000005f1e <spin_unlock>:
    5f1e:	55                   	push   %rbp
    5f1f:	48 89 e5             	mov    %rsp,%rbp
    5f22:	48 83 ec 08          	sub    $0x8,%rsp
    5f26:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    5f2a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    5f2e:	be 00 00 00 00       	mov    $0x0,%esi
    5f33:	48 89 c7             	mov    %rax,%rdi
    5f36:	e8 92 ff ff ff       	call   5ecd <atomic_xchg>
    5f3b:	90                   	nop
    5f3c:	c9                   	leave
    5f3d:	c3                   	ret

0000000000005f3e <slab_fetch_buddy>:
    5f3e:	55                   	push   %rbp
    5f3f:	48 89 e5             	mov    %rsp,%rbp
    5f42:	48 83 ec 40          	sub    $0x40,%rsp
    5f46:	89 7d cc             	mov    %edi,-0x34(%rbp)
    5f49:	89 75 c8             	mov    %esi,-0x38(%rbp)
    5f4c:	bf 00 40 00 00       	mov    $0x4000,%edi
    5f51:	e8 70 e4 ff ff       	call   43c6 <buddy_alloc>
    5f56:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    5f5a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
    5f5f:	75 2d                	jne    5f8e <slab_fetch_buddy+0x50>
    5f61:	e8 8a d1 ff ff       	call   30f0 <__asan_handle_no_return@plt>
    5f66:	48 8d 05 f3 32 00 00 	lea    0x32f3(%rip),%rax        # 9260 <__PRETTY_FUNCTION__.2>
    5f6d:	48 89 c1             	mov    %rax,%rcx
    5f70:	ba 09 00 00 00       	mov    $0x9,%edx
    5f75:	48 8d 05 24 31 00 00 	lea    0x3124(%rip),%rax        # 90a0 <__PRETTY_FUNCTION__.0+0x140>
    5f7c:	48 89 c6             	mov    %rax,%rsi
    5f7f:	48 8d 05 5a 31 00 00 	lea    0x315a(%rip),%rax        # 90e0 <__PRETTY_FUNCTION__.0+0x180>
    5f86:	48 89 c7             	mov    %rax,%rdi
    5f89:	e8 12 d1 ff ff       	call   30a0 <__assert_fail@plt>
    5f8e:	48 8d 05 cb 71 00 00 	lea    0x71cb(%rip),%rax        # d160 <table>
    5f95:	48 89 c2             	mov    %rax,%rdx
    5f98:	48 c1 ea 03          	shr    $0x3,%rdx
    5f9c:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    5fa3:	0f b6 12             	movzbl (%rdx),%edx
    5fa6:	84 d2                	test   %dl,%dl
    5fa8:	74 08                	je     5fb2 <slab_fetch_buddy+0x74>
    5faa:	48 89 c7             	mov    %rax,%rdi
    5fad:	e8 8e d1 ff ff       	call   3140 <__asan_report_load8@plt>
    5fb2:	48 8b 15 a7 71 00 00 	mov    0x71a7(%rip),%rdx        # d160 <table>
    5fb9:	48 8b 05 80 88 00 00 	mov    0x8880(%rip),%rax        # e840 <heap>
    5fc0:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    5fc4:	48 29 c1             	sub    %rax,%rcx
    5fc7:	48 89 c8             	mov    %rcx,%rax
    5fca:	48 8d 88 ff 0f 00 00 	lea    0xfff(%rax),%rcx
    5fd1:	48 85 c0             	test   %rax,%rax
    5fd4:	48 0f 48 c1          	cmovs  %rcx,%rax
    5fd8:	48 c1 f8 0c          	sar    $0xc,%rax
    5fdc:	48 89 c1             	mov    %rax,%rcx
    5fdf:	48 89 c8             	mov    %rcx,%rax
    5fe2:	48 01 c0             	add    %rax,%rax
    5fe5:	48 01 c8             	add    %rcx,%rax
    5fe8:	48 c1 e0 03          	shl    $0x3,%rax
    5fec:	48 01 d0             	add    %rdx,%rax
    5fef:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    5ff3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    5ff7:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    5ffb:	e9 aa 00 00 00       	jmp    60aa <slab_fetch_buddy+0x16c>
    6000:	8b 45 cc             	mov    -0x34(%rbp),%eax
    6003:	83 c0 03             	add    $0x3,%eax
    6006:	83 e0 1f             	and    $0x1f,%eax
    6009:	89 c1                	mov    %eax,%ecx
    600b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    600f:	48 83 c0 10          	add    $0x10,%rax
    6013:	48 89 c2             	mov    %rax,%rdx
    6016:	48 89 d0             	mov    %rdx,%rax
    6019:	48 c1 e8 03          	shr    $0x3,%rax
    601d:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    6023:	0f b6 00             	movzbl (%rax),%eax
    6026:	84 c0                	test   %al,%al
    6028:	40 0f 95 c6          	setne  %sil
    602c:	84 c0                	test   %al,%al
    602e:	0f 9e c0             	setle  %al
    6031:	21 f0                	and    %esi,%eax
    6033:	84 c0                	test   %al,%al
    6035:	74 08                	je     603f <slab_fetch_buddy+0x101>
    6037:	48 89 d7             	mov    %rdx,%rdi
    603a:	e8 f1 d0 ff ff       	call   3130 <__asan_report_store1@plt>
    603f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    6043:	83 e1 1f             	and    $0x1f,%ecx
    6046:	0f b6 50 10          	movzbl 0x10(%rax),%edx
    604a:	83 e2 e0             	and    $0xffffffe0,%edx
    604d:	09 ca                	or     %ecx,%edx
    604f:	88 50 10             	mov    %dl,0x10(%rax)
    6052:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    6056:	0f b6 50 10          	movzbl 0x10(%rax),%edx
    605a:	83 ca 40             	or     $0x40,%edx
    605d:	88 50 10             	mov    %dl,0x10(%rax)
    6060:	8b 45 c8             	mov    -0x38(%rbp),%eax
    6063:	89 c1                	mov    %eax,%ecx
    6065:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    6069:	48 83 c0 11          	add    $0x11,%rax
    606d:	48 89 c2             	mov    %rax,%rdx
    6070:	48 c1 ea 03          	shr    $0x3,%rdx
    6074:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    607b:	0f b6 12             	movzbl (%rdx),%edx
    607e:	84 d2                	test   %dl,%dl
    6080:	40 0f 95 c6          	setne  %sil
    6084:	48 89 c7             	mov    %rax,%rdi
    6087:	83 e7 07             	and    $0x7,%edi
    608a:	40 38 d7             	cmp    %dl,%dil
    608d:	0f 9d c2             	setge  %dl
    6090:	21 f2                	and    %esi,%edx
    6092:	84 d2                	test   %dl,%dl
    6094:	74 08                	je     609e <slab_fetch_buddy+0x160>
    6096:	48 89 c7             	mov    %rax,%rdi
    6099:	e8 92 d0 ff ff       	call   3130 <__asan_report_store1@plt>
    609e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    60a2:	88 48 11             	mov    %cl,0x11(%rax)
    60a5:	48 83 45 d0 18       	addq   $0x18,-0x30(%rbp)
    60aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    60ae:	48 83 c0 60          	add    $0x60,%rax
    60b2:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
    60b6:	0f 82 44 ff ff ff    	jb     6000 <slab_fetch_buddy+0xc2>
    60bc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    60c0:	48 05 00 40 00 00    	add    $0x4000,%rax
    60c6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    60ca:	b8 00 00 00 00       	mov    $0x0,%eax
    60cf:	e8 4b fa ff ff       	call   5b1f <cpu_current>
    60d4:	89 c6                	mov    %eax,%esi
    60d6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    60da:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    60de:	49 89 d1             	mov    %rdx,%r9
    60e1:	49 89 c0             	mov    %rax,%r8
    60e4:	b9 11 00 00 00       	mov    $0x11,%ecx
    60e9:	48 8d 05 b0 31 00 00 	lea    0x31b0(%rip),%rax        # 92a0 <__FUNCTION__.1>
    60f0:	48 89 c2             	mov    %rax,%rdx
    60f3:	48 8d 05 26 30 00 00 	lea    0x3026(%rip),%rax        # 9120 <__PRETTY_FUNCTION__.0+0x1c0>
    60fa:	48 89 c7             	mov    %rax,%rdi
    60fd:	b8 00 00 00 00       	mov    $0x0,%eax
    6102:	e8 39 cf ff ff       	call   3040 <printf@plt>
    6107:	8b 45 cc             	mov    -0x34(%rbp),%eax
    610a:	48 63 d0             	movslq %eax,%rdx
    610d:	48 89 d0             	mov    %rdx,%rax
    6110:	48 c1 e0 03          	shl    $0x3,%rax
    6114:	48 29 d0             	sub    %rdx,%rax
    6117:	48 c1 e0 03          	shl    $0x3,%rax
    611b:	8b 55 c8             	mov    -0x38(%rbp),%edx
    611e:	48 63 d2             	movslq %edx,%rdx
    6121:	48 69 d2 30 02 00 00 	imul   $0x230,%rdx,%rdx
    6128:	48 01 c2             	add    %rax,%rdx
    612b:	48 8d 05 4e 87 00 00 	lea    0x874e(%rip),%rax        # e880 <slab>
    6132:	48 01 d0             	add    %rdx,%rax
    6135:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    6139:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    613d:	48 83 c0 30          	add    $0x30,%rax
    6141:	48 89 c2             	mov    %rax,%rdx
    6144:	48 89 d0             	mov    %rdx,%rax
    6147:	48 c1 e8 03          	shr    $0x3,%rax
    614b:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    6151:	0f b6 00             	movzbl (%rax),%eax
    6154:	84 c0                	test   %al,%al
    6156:	0f 95 c1             	setne  %cl
    6159:	3c 03                	cmp    $0x3,%al
    615b:	0f 9e c0             	setle  %al
    615e:	21 c8                	and    %ecx,%eax
    6160:	84 c0                	test   %al,%al
    6162:	74 08                	je     616c <slab_fetch_buddy+0x22e>
    6164:	48 89 d7             	mov    %rdx,%rdi
    6167:	e8 c4 ce ff ff       	call   3030 <__asan_report_store4@plt>
    616c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6170:	c7 40 30 00 00 00 00 	movl   $0x0,0x30(%rax)
    6177:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    617b:	48 83 c0 20          	add    $0x20,%rax
    617f:	48 89 c2             	mov    %rax,%rdx
    6182:	48 c1 ea 03          	shr    $0x3,%rdx
    6186:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    618d:	0f b6 12             	movzbl (%rdx),%edx
    6190:	84 d2                	test   %dl,%dl
    6192:	74 08                	je     619c <slab_fetch_buddy+0x25e>
    6194:	48 89 c7             	mov    %rax,%rdi
    6197:	e8 34 cf ff ff       	call   30d0 <__asan_report_store8@plt>
    619c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    61a0:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
    61a7:	00 
    61a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    61ac:	48 8b 50 20          	mov    0x20(%rax),%rdx
    61b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    61b4:	48 83 c0 18          	add    $0x18,%rax
    61b8:	48 89 c1             	mov    %rax,%rcx
    61bb:	48 c1 e9 03          	shr    $0x3,%rcx
    61bf:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    61c6:	0f b6 09             	movzbl (%rcx),%ecx
    61c9:	84 c9                	test   %cl,%cl
    61cb:	74 08                	je     61d5 <slab_fetch_buddy+0x297>
    61cd:	48 89 c7             	mov    %rax,%rdi
    61d0:	e8 fb ce ff ff       	call   30d0 <__asan_report_store8@plt>
    61d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    61d9:	48 89 50 18          	mov    %rdx,0x18(%rax)
    61dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    61e1:	48 89 c2             	mov    %rax,%rdx
    61e4:	48 c1 ea 03          	shr    $0x3,%rdx
    61e8:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    61ef:	0f b6 12             	movzbl (%rdx),%edx
    61f2:	84 d2                	test   %dl,%dl
    61f4:	74 08                	je     61fe <slab_fetch_buddy+0x2c0>
    61f6:	48 89 c7             	mov    %rax,%rdi
    61f9:	e8 d2 ce ff ff       	call   30d0 <__asan_report_store8@plt>
    61fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6202:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    6206:	48 89 10             	mov    %rdx,(%rax)
    6209:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    620d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    6211:	e9 8c 00 00 00       	jmp    62a2 <slab_fetch_buddy+0x364>
    6216:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    621a:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
    621e:	74 0a                	je     622a <slab_fetch_buddy+0x2ec>
    6220:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    6224:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
    6228:	eb 05                	jmp    622f <slab_fetch_buddy+0x2f1>
    622a:	ba 00 00 00 00       	mov    $0x0,%edx
    622f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    6233:	48 89 c1             	mov    %rax,%rcx
    6236:	48 c1 e9 03          	shr    $0x3,%rcx
    623a:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    6241:	0f b6 09             	movzbl (%rcx),%ecx
    6244:	84 c9                	test   %cl,%cl
    6246:	74 08                	je     6250 <slab_fetch_buddy+0x312>
    6248:	48 89 c7             	mov    %rax,%rdi
    624b:	e8 80 ce ff ff       	call   30d0 <__asan_report_store8@plt>
    6250:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    6254:	48 89 10             	mov    %rdx,(%rax)
    6257:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    625b:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    625f:	74 0a                	je     626b <slab_fetch_buddy+0x32d>
    6261:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    6265:	48 8d 50 10          	lea    0x10(%rax),%rdx
    6269:	eb 05                	jmp    6270 <slab_fetch_buddy+0x332>
    626b:	ba 00 00 00 00       	mov    $0x0,%edx
    6270:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    6274:	48 83 c0 08          	add    $0x8,%rax
    6278:	48 89 c1             	mov    %rax,%rcx
    627b:	48 c1 e9 03          	shr    $0x3,%rcx
    627f:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    6286:	0f b6 09             	movzbl (%rcx),%ecx
    6289:	84 c9                	test   %cl,%cl
    628b:	74 08                	je     6295 <slab_fetch_buddy+0x357>
    628d:	48 89 c7             	mov    %rax,%rdi
    6290:	e8 3b ce ff ff       	call   30d0 <__asan_report_store8@plt>
    6295:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    6299:	48 89 50 08          	mov    %rdx,0x8(%rax)
    629d:	48 83 45 d8 10       	addq   $0x10,-0x28(%rbp)
    62a2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    62a6:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    62aa:	0f 85 66 ff ff ff    	jne    6216 <slab_fetch_buddy+0x2d8>
    62b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    62b4:	48 8d 48 f0          	lea    -0x10(%rax),%rcx
    62b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    62bc:	48 83 c0 08          	add    $0x8,%rax
    62c0:	48 89 c2             	mov    %rax,%rdx
    62c3:	48 c1 ea 03          	shr    $0x3,%rdx
    62c7:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    62ce:	0f b6 12             	movzbl (%rdx),%edx
    62d1:	84 d2                	test   %dl,%dl
    62d3:	74 08                	je     62dd <slab_fetch_buddy+0x39f>
    62d5:	48 89 c7             	mov    %rax,%rdi
    62d8:	e8 f3 cd ff ff       	call   30d0 <__asan_report_store8@plt>
    62dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    62e1:	48 89 48 08          	mov    %rcx,0x8(%rax)
    62e5:	8b 45 cc             	mov    -0x34(%rbp),%eax
    62e8:	8d 70 03             	lea    0x3(%rax),%esi
    62eb:	b8 00 40 00 00       	mov    $0x4000,%eax
    62f0:	99                   	cltd
    62f1:	f7 fe                	idiv   %esi
    62f3:	89 c1                	mov    %eax,%ecx
    62f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    62f9:	48 83 c0 10          	add    $0x10,%rax
    62fd:	48 89 c2             	mov    %rax,%rdx
    6300:	48 89 d0             	mov    %rdx,%rax
    6303:	48 c1 e8 03          	shr    $0x3,%rax
    6307:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    630d:	0f b6 00             	movzbl (%rax),%eax
    6310:	84 c0                	test   %al,%al
    6312:	40 0f 95 c6          	setne  %sil
    6316:	3c 03                	cmp    $0x3,%al
    6318:	0f 9e c0             	setle  %al
    631b:	21 f0                	and    %esi,%eax
    631d:	84 c0                	test   %al,%al
    631f:	74 08                	je     6329 <slab_fetch_buddy+0x3eb>
    6321:	48 89 d7             	mov    %rdx,%rdi
    6324:	e8 07 cd ff ff       	call   3030 <__asan_report_store4@plt>
    6329:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    632d:	89 48 10             	mov    %ecx,0x10(%rax)
    6330:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6334:	48 83 c0 28          	add    $0x28,%rax
    6338:	48 89 c2             	mov    %rax,%rdx
    633b:	48 89 d0             	mov    %rdx,%rax
    633e:	48 c1 e8 03          	shr    $0x3,%rax
    6342:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    6348:	0f b6 00             	movzbl (%rax),%eax
    634b:	84 c0                	test   %al,%al
    634d:	0f 95 c1             	setne  %cl
    6350:	3c 03                	cmp    $0x3,%al
    6352:	0f 9e c0             	setle  %al
    6355:	21 c8                	and    %ecx,%eax
    6357:	84 c0                	test   %al,%al
    6359:	74 08                	je     6363 <slab_fetch_buddy+0x425>
    635b:	48 89 d7             	mov    %rdx,%rdi
    635e:	e8 cd cc ff ff       	call   3030 <__asan_report_store4@plt>
    6363:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6367:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%rax)
    636e:	90                   	nop
    636f:	c9                   	leave
    6370:	c3                   	ret

0000000000006371 <slab_init>:
    6371:	55                   	push   %rbp
    6372:	48 89 e5             	mov    %rsp,%rbp
    6375:	48 83 ec 10          	sub    $0x10,%rsp
    6379:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    6380:	eb 26                	jmp    63a8 <slab_init+0x37>
    6382:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    6389:	eb 13                	jmp    639e <slab_init+0x2d>
    638b:	8b 55 f8             	mov    -0x8(%rbp),%edx
    638e:	8b 45 fc             	mov    -0x4(%rbp),%eax
    6391:	89 d6                	mov    %edx,%esi
    6393:	89 c7                	mov    %eax,%edi
    6395:	e8 a4 fb ff ff       	call   5f3e <slab_fetch_buddy>
    639a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    639e:	83 7d fc 09          	cmpl   $0x9,-0x4(%rbp)
    63a2:	7e e7                	jle    638b <slab_init+0x1a>
    63a4:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    63a8:	b8 00 00 00 00       	mov    $0x0,%eax
    63ad:	e8 78 f7 ff ff       	call   5b2a <cpu_count>
    63b2:	39 45 f8             	cmp    %eax,-0x8(%rbp)
    63b5:	7c cb                	jl     6382 <slab_init+0x11>
    63b7:	90                   	nop
    63b8:	90                   	nop
    63b9:	c9                   	leave
    63ba:	c3                   	ret

00000000000063bb <slab_list_insert>:
    63bb:	55                   	push   %rbp
    63bc:	48 89 e5             	mov    %rsp,%rbp
    63bf:	48 83 ec 10          	sub    $0x10,%rsp
    63c3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    63c7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    63cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    63cf:	48 83 c0 08          	add    $0x8,%rax
    63d3:	48 89 c2             	mov    %rax,%rdx
    63d6:	48 c1 ea 03          	shr    $0x3,%rdx
    63da:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    63e1:	0f b6 12             	movzbl (%rdx),%edx
    63e4:	84 d2                	test   %dl,%dl
    63e6:	74 08                	je     63f0 <slab_list_insert+0x35>
    63e8:	48 89 c7             	mov    %rax,%rdi
    63eb:	e8 50 cd ff ff       	call   3140 <__asan_report_load8@plt>
    63f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    63f4:	48 8b 40 08          	mov    0x8(%rax),%rax
    63f8:	48 85 c0             	test   %rax,%rax
    63fb:	0f 85 a1 00 00 00    	jne    64a2 <slab_list_insert+0xe7>
    6401:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6405:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    6409:	48 89 50 08          	mov    %rdx,0x8(%rax)
    640d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6411:	48 8b 50 08          	mov    0x8(%rax),%rdx
    6415:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6419:	48 89 c1             	mov    %rax,%rcx
    641c:	48 c1 e9 03          	shr    $0x3,%rcx
    6420:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    6427:	0f b6 09             	movzbl (%rcx),%ecx
    642a:	84 c9                	test   %cl,%cl
    642c:	74 08                	je     6436 <slab_list_insert+0x7b>
    642e:	48 89 c7             	mov    %rax,%rdi
    6431:	e8 9a cc ff ff       	call   30d0 <__asan_report_store8@plt>
    6436:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    643a:	48 89 10             	mov    %rdx,(%rax)
    643d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    6441:	48 89 c2             	mov    %rax,%rdx
    6444:	48 c1 ea 03          	shr    $0x3,%rdx
    6448:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    644f:	0f b6 12             	movzbl (%rdx),%edx
    6452:	84 d2                	test   %dl,%dl
    6454:	74 08                	je     645e <slab_list_insert+0xa3>
    6456:	48 89 c7             	mov    %rax,%rdi
    6459:	e8 72 cc ff ff       	call   30d0 <__asan_report_store8@plt>
    645e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    6462:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    6469:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    646d:	48 8b 10             	mov    (%rax),%rdx
    6470:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    6474:	48 83 c0 08          	add    $0x8,%rax
    6478:	48 89 c1             	mov    %rax,%rcx
    647b:	48 c1 e9 03          	shr    $0x3,%rcx
    647f:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    6486:	0f b6 09             	movzbl (%rcx),%ecx
    6489:	84 c9                	test   %cl,%cl
    648b:	74 08                	je     6495 <slab_list_insert+0xda>
    648d:	48 89 c7             	mov    %rax,%rdi
    6490:	e8 3b cc ff ff       	call   30d0 <__asan_report_store8@plt>
    6495:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    6499:	48 89 50 08          	mov    %rdx,0x8(%rax)
    649d:	e9 c3 00 00 00       	jmp    6565 <slab_list_insert+0x1aa>
    64a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    64a6:	48 83 c0 08          	add    $0x8,%rax
    64aa:	48 89 c2             	mov    %rax,%rdx
    64ad:	48 c1 ea 03          	shr    $0x3,%rdx
    64b1:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    64b8:	0f b6 12             	movzbl (%rdx),%edx
    64bb:	84 d2                	test   %dl,%dl
    64bd:	74 08                	je     64c7 <slab_list_insert+0x10c>
    64bf:	48 89 c7             	mov    %rax,%rdi
    64c2:	e8 79 cc ff ff       	call   3140 <__asan_report_load8@plt>
    64c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    64cb:	48 8b 40 08          	mov    0x8(%rax),%rax
    64cf:	48 8d 50 08          	lea    0x8(%rax),%rdx
    64d3:	48 89 d1             	mov    %rdx,%rcx
    64d6:	48 c1 e9 03          	shr    $0x3,%rcx
    64da:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    64e1:	0f b6 09             	movzbl (%rcx),%ecx
    64e4:	84 c9                	test   %cl,%cl
    64e6:	74 08                	je     64f0 <slab_list_insert+0x135>
    64e8:	48 89 d7             	mov    %rdx,%rdi
    64eb:	e8 e0 cb ff ff       	call   30d0 <__asan_report_store8@plt>
    64f0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    64f4:	48 89 50 08          	mov    %rdx,0x8(%rax)
    64f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    64fc:	48 8b 50 08          	mov    0x8(%rax),%rdx
    6500:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    6504:	48 89 c1             	mov    %rax,%rcx
    6507:	48 c1 e9 03          	shr    $0x3,%rcx
    650b:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    6512:	0f b6 09             	movzbl (%rcx),%ecx
    6515:	84 c9                	test   %cl,%cl
    6517:	74 08                	je     6521 <slab_list_insert+0x166>
    6519:	48 89 c7             	mov    %rax,%rdi
    651c:	e8 af cb ff ff       	call   30d0 <__asan_report_store8@plt>
    6521:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    6525:	48 89 10             	mov    %rdx,(%rax)
    6528:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    652c:	48 83 c0 08          	add    $0x8,%rax
    6530:	48 89 c2             	mov    %rax,%rdx
    6533:	48 c1 ea 03          	shr    $0x3,%rdx
    6537:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    653e:	0f b6 12             	movzbl (%rdx),%edx
    6541:	84 d2                	test   %dl,%dl
    6543:	74 08                	je     654d <slab_list_insert+0x192>
    6545:	48 89 c7             	mov    %rax,%rdi
    6548:	e8 83 cb ff ff       	call   30d0 <__asan_report_store8@plt>
    654d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    6551:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    6558:	00 
    6559:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    655d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    6561:	48 89 50 08          	mov    %rdx,0x8(%rax)
    6565:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6569:	48 83 c0 10          	add    $0x10,%rax
    656d:	48 89 c2             	mov    %rax,%rdx
    6570:	48 89 d0             	mov    %rdx,%rax
    6573:	48 c1 e8 03          	shr    $0x3,%rax
    6577:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    657d:	0f b6 00             	movzbl (%rax),%eax
    6580:	84 c0                	test   %al,%al
    6582:	0f 95 c1             	setne  %cl
    6585:	3c 03                	cmp    $0x3,%al
    6587:	0f 9e c0             	setle  %al
    658a:	21 c8                	and    %ecx,%eax
    658c:	84 c0                	test   %al,%al
    658e:	74 08                	je     6598 <slab_list_insert+0x1dd>
    6590:	48 89 d7             	mov    %rdx,%rdi
    6593:	e8 f8 ca ff ff       	call   3090 <__asan_report_load4@plt>
    6598:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    659c:	8b 40 10             	mov    0x10(%rax),%eax
    659f:	8d 50 01             	lea    0x1(%rax),%edx
    65a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    65a6:	89 50 10             	mov    %edx,0x10(%rax)
    65a9:	90                   	nop
    65aa:	c9                   	leave
    65ab:	c3                   	ret

00000000000065ac <slab_list_poll>:
    65ac:	55                   	push   %rbp
    65ad:	48 89 e5             	mov    %rsp,%rbp
    65b0:	48 83 ec 20          	sub    $0x20,%rsp
    65b4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    65b8:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    65bf:	00 
    65c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    65c4:	48 89 c2             	mov    %rax,%rdx
    65c7:	48 c1 ea 03          	shr    $0x3,%rdx
    65cb:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    65d2:	0f b6 12             	movzbl (%rdx),%edx
    65d5:	84 d2                	test   %dl,%dl
    65d7:	74 08                	je     65e1 <slab_list_poll+0x35>
    65d9:	48 89 c7             	mov    %rax,%rdi
    65dc:	e8 5f cb ff ff       	call   3140 <__asan_report_load8@plt>
    65e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    65e5:	48 8b 00             	mov    (%rax),%rax
    65e8:	48 85 c0             	test   %rax,%rax
    65eb:	0f 84 aa 00 00 00    	je     669b <slab_list_poll+0xef>
    65f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    65f5:	48 8b 00             	mov    (%rax),%rax
    65f8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    65fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6600:	48 83 c0 08          	add    $0x8,%rax
    6604:	48 89 c2             	mov    %rax,%rdx
    6607:	48 c1 ea 03          	shr    $0x3,%rdx
    660b:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    6612:	0f b6 12             	movzbl (%rdx),%edx
    6615:	84 d2                	test   %dl,%dl
    6617:	74 08                	je     6621 <slab_list_poll+0x75>
    6619:	48 89 c7             	mov    %rax,%rdi
    661c:	e8 1f cb ff ff       	call   3140 <__asan_report_load8@plt>
    6621:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6625:	48 8b 50 08          	mov    0x8(%rax),%rdx
    6629:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    662d:	48 89 10             	mov    %rdx,(%rax)
    6630:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    6634:	48 8b 00             	mov    (%rax),%rax
    6637:	48 85 c0             	test   %rax,%rax
    663a:	74 2e                	je     666a <slab_list_poll+0xbe>
    663c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    6640:	48 8b 00             	mov    (%rax),%rax
    6643:	48 89 c2             	mov    %rax,%rdx
    6646:	48 89 d1             	mov    %rdx,%rcx
    6649:	48 c1 e9 03          	shr    $0x3,%rcx
    664d:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    6654:	0f b6 09             	movzbl (%rcx),%ecx
    6657:	84 c9                	test   %cl,%cl
    6659:	74 08                	je     6663 <slab_list_poll+0xb7>
    665b:	48 89 d7             	mov    %rdx,%rdi
    665e:	e8 6d ca ff ff       	call   30d0 <__asan_report_store8@plt>
    6663:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    666a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    666e:	48 83 c0 08          	add    $0x8,%rax
    6672:	48 89 c2             	mov    %rax,%rdx
    6675:	48 c1 ea 03          	shr    $0x3,%rdx
    6679:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    6680:	0f b6 12             	movzbl (%rdx),%edx
    6683:	84 d2                	test   %dl,%dl
    6685:	74 08                	je     668f <slab_list_poll+0xe3>
    6687:	48 89 c7             	mov    %rax,%rdi
    668a:	e8 41 ca ff ff       	call   30d0 <__asan_report_store8@plt>
    668f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6693:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    669a:	00 
    669b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    669f:	48 83 c0 10          	add    $0x10,%rax
    66a3:	48 89 c2             	mov    %rax,%rdx
    66a6:	48 89 d0             	mov    %rdx,%rax
    66a9:	48 c1 e8 03          	shr    $0x3,%rax
    66ad:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    66b3:	0f b6 00             	movzbl (%rax),%eax
    66b6:	84 c0                	test   %al,%al
    66b8:	0f 95 c1             	setne  %cl
    66bb:	3c 03                	cmp    $0x3,%al
    66bd:	0f 9e c0             	setle  %al
    66c0:	21 c8                	and    %ecx,%eax
    66c2:	84 c0                	test   %al,%al
    66c4:	74 08                	je     66ce <slab_list_poll+0x122>
    66c6:	48 89 d7             	mov    %rdx,%rdi
    66c9:	e8 c2 c9 ff ff       	call   3090 <__asan_report_load4@plt>
    66ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    66d2:	8b 40 10             	mov    0x10(%rax),%eax
    66d5:	8d 50 ff             	lea    -0x1(%rax),%edx
    66d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    66dc:	89 50 10             	mov    %edx,0x10(%rax)
    66df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    66e3:	c9                   	leave
    66e4:	c3                   	ret

00000000000066e5 <slab_alloc>:
    66e5:	55                   	push   %rbp
    66e6:	48 89 e5             	mov    %rsp,%rbp
    66e9:	48 83 ec 30          	sub    $0x30,%rsp
    66ed:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    66f1:	c7 45 e4 0c 00 00 00 	movl   $0xc,-0x1c(%rbp)
    66f8:	eb 04                	jmp    66fe <slab_alloc+0x19>
    66fa:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
    66fe:	83 7d e4 0b          	cmpl   $0xb,-0x1c(%rbp)
    6702:	7f 16                	jg     671a <slab_alloc+0x35>
    6704:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    6707:	ba 01 00 00 00       	mov    $0x1,%edx
    670c:	89 c1                	mov    %eax,%ecx
    670e:	d3 e2                	shl    %cl,%edx
    6710:	89 d0                	mov    %edx,%eax
    6712:	48 98                	cltq
    6714:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
    6718:	75 e0                	jne    66fa <slab_alloc+0x15>
    671a:	b8 00 00 00 00       	mov    $0x0,%eax
    671f:	e8 fb f3 ff ff       	call   5b1f <cpu_current>
    6724:	89 c6                	mov    %eax,%esi
    6726:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    6729:	41 89 c0             	mov    %eax,%r8d
    672c:	b9 4c 00 00 00       	mov    $0x4c,%ecx
    6731:	48 8d 05 a8 2b 00 00 	lea    0x2ba8(%rip),%rax        # 92e0 <__FUNCTION__.0>
    6738:	48 89 c2             	mov    %rax,%rdx
    673b:	48 8d 05 5e 2a 00 00 	lea    0x2a5e(%rip),%rax        # 91a0 <__PRETTY_FUNCTION__.0+0x240>
    6742:	48 89 c7             	mov    %rax,%rdi
    6745:	b8 00 00 00 00       	mov    $0x0,%eax
    674a:	e8 f1 c8 ff ff       	call   3040 <printf@plt>
    674f:	b8 00 00 00 00       	mov    $0x0,%eax
    6754:	e8 c6 f3 ff ff       	call   5b1f <cpu_current>
    6759:	89 45 e8             	mov    %eax,-0x18(%rbp)
    675c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    675f:	83 e8 03             	sub    $0x3,%eax
    6762:	89 45 ec             	mov    %eax,-0x14(%rbp)
    6765:	8b 45 ec             	mov    -0x14(%rbp),%eax
    6768:	48 63 d0             	movslq %eax,%rdx
    676b:	48 89 d0             	mov    %rdx,%rax
    676e:	48 c1 e0 03          	shl    $0x3,%rax
    6772:	48 29 d0             	sub    %rdx,%rax
    6775:	48 c1 e0 03          	shl    $0x3,%rax
    6779:	8b 55 e8             	mov    -0x18(%rbp),%edx
    677c:	48 63 d2             	movslq %edx,%rdx
    677f:	48 69 d2 30 02 00 00 	imul   $0x230,%rdx,%rdx
    6786:	48 01 c2             	add    %rax,%rdx
    6789:	48 8d 05 f0 80 00 00 	lea    0x80f0(%rip),%rax        # e880 <slab>
    6790:	48 01 d0             	add    %rdx,%rax
    6793:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    6797:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    679b:	48 89 c7             	mov    %rax,%rdi
    679e:	e8 09 fe ff ff       	call   65ac <slab_list_poll>
    67a3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    67a7:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    67ac:	74 06                	je     67b4 <slab_alloc+0xcf>
    67ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    67b2:	eb 64                	jmp    6818 <slab_alloc+0x133>
    67b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    67b8:	48 83 c0 30          	add    $0x30,%rax
    67bc:	48 89 c7             	mov    %rax,%rdi
    67bf:	e8 2a f7 ff ff       	call   5eee <spin_lock>
    67c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    67c8:	48 83 c0 18          	add    $0x18,%rax
    67cc:	48 89 c7             	mov    %rax,%rdi
    67cf:	e8 d8 fd ff ff       	call   65ac <slab_list_poll>
    67d4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    67d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    67dc:	48 83 c0 30          	add    $0x30,%rax
    67e0:	48 89 c7             	mov    %rax,%rdi
    67e3:	e8 36 f7 ff ff       	call   5f1e <spin_unlock>
    67e8:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    67ed:	74 06                	je     67f5 <slab_alloc+0x110>
    67ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    67f3:	eb 23                	jmp    6818 <slab_alloc+0x133>
    67f5:	8b 55 e8             	mov    -0x18(%rbp),%edx
    67f8:	8b 45 ec             	mov    -0x14(%rbp),%eax
    67fb:	89 d6                	mov    %edx,%esi
    67fd:	89 c7                	mov    %eax,%edi
    67ff:	e8 3a f7 ff ff       	call   5f3e <slab_fetch_buddy>
    6804:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    6808:	48 89 c7             	mov    %rax,%rdi
    680b:	e8 9c fd ff ff       	call   65ac <slab_list_poll>
    6810:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    6814:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6818:	c9                   	leave
    6819:	c3                   	ret

000000000000681a <slab_free>:
    681a:	55                   	push   %rbp
    681b:	48 89 e5             	mov    %rsp,%rbp
    681e:	48 83 ec 30          	sub    $0x30,%rsp
    6822:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    6826:	48 8d 05 33 69 00 00 	lea    0x6933(%rip),%rax        # d160 <table>
    682d:	48 89 c2             	mov    %rax,%rdx
    6830:	48 c1 ea 03          	shr    $0x3,%rdx
    6834:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    683b:	0f b6 12             	movzbl (%rdx),%edx
    683e:	84 d2                	test   %dl,%dl
    6840:	74 08                	je     684a <slab_free+0x30>
    6842:	48 89 c7             	mov    %rax,%rdi
    6845:	e8 f6 c8 ff ff       	call   3140 <__asan_report_load8@plt>
    684a:	48 8b 15 0f 69 00 00 	mov    0x690f(%rip),%rdx        # d160 <table>
    6851:	48 8b 05 e8 7f 00 00 	mov    0x7fe8(%rip),%rax        # e840 <heap>
    6858:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    685c:	48 29 c1             	sub    %rax,%rcx
    685f:	48 89 c8             	mov    %rcx,%rax
    6862:	48 8d 88 ff 0f 00 00 	lea    0xfff(%rax),%rcx
    6869:	48 85 c0             	test   %rax,%rax
    686c:	48 0f 48 c1          	cmovs  %rcx,%rax
    6870:	48 c1 f8 0c          	sar    $0xc,%rax
    6874:	48 89 c1             	mov    %rax,%rcx
    6877:	48 89 c8             	mov    %rcx,%rax
    687a:	48 01 c0             	add    %rax,%rax
    687d:	48 01 c8             	add    %rcx,%rax
    6880:	48 c1 e0 03          	shl    $0x3,%rax
    6884:	48 01 d0             	add    %rdx,%rax
    6887:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    688b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    688f:	48 83 c0 10          	add    $0x10,%rax
    6893:	48 89 c2             	mov    %rax,%rdx
    6896:	48 89 d0             	mov    %rdx,%rax
    6899:	48 c1 e8 03          	shr    $0x3,%rax
    689d:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    68a3:	0f b6 00             	movzbl (%rax),%eax
    68a6:	84 c0                	test   %al,%al
    68a8:	0f 95 c1             	setne  %cl
    68ab:	84 c0                	test   %al,%al
    68ad:	0f 9e c0             	setle  %al
    68b0:	21 c8                	and    %ecx,%eax
    68b2:	84 c0                	test   %al,%al
    68b4:	74 08                	je     68be <slab_free+0xa4>
    68b6:	48 89 d7             	mov    %rdx,%rdi
    68b9:	e8 62 c8 ff ff       	call   3120 <__asan_report_load1@plt>
    68be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    68c2:	0f b6 40 10          	movzbl 0x10(%rax),%eax
    68c6:	83 e0 1f             	and    $0x1f,%eax
    68c9:	0f b6 c0             	movzbl %al,%eax
    68cc:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    68cf:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    68d2:	83 e8 03             	sub    $0x3,%eax
    68d5:	89 45 e8             	mov    %eax,-0x18(%rbp)
    68d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    68dc:	48 83 c0 11          	add    $0x11,%rax
    68e0:	48 89 c2             	mov    %rax,%rdx
    68e3:	48 c1 ea 03          	shr    $0x3,%rdx
    68e7:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    68ee:	0f b6 12             	movzbl (%rdx),%edx
    68f1:	84 d2                	test   %dl,%dl
    68f3:	0f 95 c1             	setne  %cl
    68f6:	48 89 c6             	mov    %rax,%rsi
    68f9:	83 e6 07             	and    $0x7,%esi
    68fc:	40 38 d6             	cmp    %dl,%sil
    68ff:	0f 9d c2             	setge  %dl
    6902:	21 ca                	and    %ecx,%edx
    6904:	84 d2                	test   %dl,%dl
    6906:	74 08                	je     6910 <slab_free+0xf6>
    6908:	48 89 c7             	mov    %rax,%rdi
    690b:	e8 10 c8 ff ff       	call   3120 <__asan_report_load1@plt>
    6910:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    6914:	0f b6 40 11          	movzbl 0x11(%rax),%eax
    6918:	0f b6 c0             	movzbl %al,%eax
    691b:	89 45 ec             	mov    %eax,-0x14(%rbp)
    691e:	8b 45 e8             	mov    -0x18(%rbp),%eax
    6921:	48 63 d0             	movslq %eax,%rdx
    6924:	48 89 d0             	mov    %rdx,%rax
    6927:	48 c1 e0 03          	shl    $0x3,%rax
    692b:	48 29 d0             	sub    %rdx,%rax
    692e:	48 c1 e0 03          	shl    $0x3,%rax
    6932:	8b 55 ec             	mov    -0x14(%rbp),%edx
    6935:	48 63 d2             	movslq %edx,%rdx
    6938:	48 69 d2 30 02 00 00 	imul   $0x230,%rdx,%rdx
    693f:	48 01 c2             	add    %rax,%rdx
    6942:	48 8d 05 37 7f 00 00 	lea    0x7f37(%rip),%rax        # e880 <slab>
    6949:	48 01 d0             	add    %rdx,%rax
    694c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    6950:	b8 00 00 00 00       	mov    $0x0,%eax
    6955:	e8 c5 f1 ff ff       	call   5b1f <cpu_current>
    695a:	39 45 ec             	cmp    %eax,-0x14(%rbp)
    695d:	75 15                	jne    6974 <slab_free+0x15a>
    695f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6963:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    6967:	48 89 d6             	mov    %rdx,%rsi
    696a:	48 89 c7             	mov    %rax,%rdi
    696d:	e8 49 fa ff ff       	call   63bb <slab_list_insert>
    6972:	eb 37                	jmp    69ab <slab_free+0x191>
    6974:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6978:	48 83 c0 30          	add    $0x30,%rax
    697c:	48 89 c7             	mov    %rax,%rdi
    697f:	e8 6a f5 ff ff       	call   5eee <spin_lock>
    6984:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6988:	48 8d 50 18          	lea    0x18(%rax),%rdx
    698c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    6990:	48 89 c6             	mov    %rax,%rsi
    6993:	48 89 d7             	mov    %rdx,%rdi
    6996:	e8 20 fa ff ff       	call   63bb <slab_list_insert>
    699b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    699f:	48 83 c0 30          	add    $0x30,%rax
    69a3:	48 89 c7             	mov    %rax,%rdi
    69a6:	e8 73 f5 ff ff       	call   5f1e <spin_unlock>
    69ab:	90                   	nop
    69ac:	c9                   	leave
    69ad:	c3                   	ret

00000000000069ae <_sub_D_00099_0>:
    69ae:	55                   	push   %rbp
    69af:	48 89 e5             	mov    %rsp,%rbp
    69b2:	be 0e 00 00 00       	mov    $0xe,%esi
    69b7:	48 8d 05 02 5b 00 00 	lea    0x5b02(%rip),%rax        # c4c0 <tptr+0xc0>
    69be:	48 89 c7             	mov    %rax,%rdi
    69c1:	e8 1a c7 ff ff       	call   30e0 <__asan_unregister_globals@plt>
    69c6:	5d                   	pop    %rbp
    69c7:	c3                   	ret

00000000000069c8 <_sub_I_00099_1>:
    69c8:	55                   	push   %rbp
    69c9:	48 89 e5             	mov    %rsp,%rbp
    69cc:	e8 2f c7 ff ff       	call   3100 <__asan_init@plt>
    69d1:	e8 7a c7 ff ff       	call   3150 <__asan_version_mismatch_check_v8@plt>
    69d6:	be 0e 00 00 00       	mov    $0xe,%esi
    69db:	48 8d 05 de 5a 00 00 	lea    0x5ade(%rip),%rax        # c4c0 <tptr+0xc0>
    69e2:	48 89 c7             	mov    %rax,%rdi
    69e5:	e8 66 c6 ff ff       	call   3050 <__asan_register_globals@plt>
    69ea:	5d                   	pop    %rbp
    69eb:	c3                   	ret

00000000000069ec <wrapper>:
    69ec:	55                   	push   %rbp
    69ed:	48 89 e5             	mov    %rsp,%rbp
    69f0:	48 83 ec 20          	sub    $0x20,%rsp
    69f4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    69f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    69fc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    6a00:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6a04:	48 83 c0 10          	add    $0x10,%rax
    6a08:	48 89 c2             	mov    %rax,%rdx
    6a0b:	48 c1 ea 03          	shr    $0x3,%rdx
    6a0f:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    6a16:	0f b6 12             	movzbl (%rdx),%edx
    6a19:	84 d2                	test   %dl,%dl
    6a1b:	74 08                	je     6a25 <wrapper+0x39>
    6a1d:	48 89 c7             	mov    %rax,%rdi
    6a20:	e8 1b c7 ff ff       	call   3140 <__asan_report_load8@plt>
    6a25:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6a29:	48 8b 48 10          	mov    0x10(%rax),%rcx
    6a2d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6a31:	48 89 c2             	mov    %rax,%rdx
    6a34:	48 89 d0             	mov    %rdx,%rax
    6a37:	48 c1 e8 03          	shr    $0x3,%rax
    6a3b:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    6a41:	0f b6 00             	movzbl (%rax),%eax
    6a44:	84 c0                	test   %al,%al
    6a46:	40 0f 95 c6          	setne  %sil
    6a4a:	3c 03                	cmp    $0x3,%al
    6a4c:	0f 9e c0             	setle  %al
    6a4f:	21 f0                	and    %esi,%eax
    6a51:	84 c0                	test   %al,%al
    6a53:	74 08                	je     6a5d <wrapper+0x71>
    6a55:	48 89 d7             	mov    %rdx,%rdi
    6a58:	e8 33 c6 ff ff       	call   3090 <__asan_report_load4@plt>
    6a5d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6a61:	8b 00                	mov    (%rax),%eax
    6a63:	89 c7                	mov    %eax,%edi
    6a65:	ff d1                	call   *%rcx
    6a67:	b8 00 00 00 00       	mov    $0x0,%eax
    6a6c:	c9                   	leave
    6a6d:	c3                   	ret

0000000000006a6e <create>:
    6a6e:	55                   	push   %rbp
    6a6f:	48 89 e5             	mov    %rsp,%rbp
    6a72:	48 83 ec 30          	sub    $0x30,%rsp
    6a76:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    6a7a:	48 8b 15 ff 5d 00 00 	mov    0x5dff(%rip),%rdx        # c880 <tptr>
    6a81:	48 8d 05 98 8f 00 00 	lea    0x8f98(%rip),%rax        # fa20 <tpool>
    6a88:	48 29 c2             	sub    %rax,%rdx
    6a8b:	48 81 fa e8 05 00 00 	cmp    $0x5e8,%rdx
    6a92:	7e 2d                	jle    6ac1 <create+0x53>
    6a94:	e8 57 c6 ff ff       	call   30f0 <__asan_handle_no_return@plt>
    6a99:	48 8d 05 c0 29 00 00 	lea    0x29c0(%rip),%rax        # 9460 <__PRETTY_FUNCTION__.1>
    6aa0:	48 89 c1             	mov    %rax,%rcx
    6aa3:	ba 28 00 00 00       	mov    $0x28,%edx
    6aa8:	48 8d 05 f1 28 00 00 	lea    0x28f1(%rip),%rax        # 93a0 <__FUNCTION__.0+0xc0>
    6aaf:	48 89 c6             	mov    %rax,%rsi
    6ab2:	48 8d 05 27 29 00 00 	lea    0x2927(%rip),%rax        # 93e0 <__FUNCTION__.0+0x100>
    6ab9:	48 89 c7             	mov    %rax,%rdi
    6abc:	e8 df c5 ff ff       	call   30a0 <__assert_fail@plt>
    6ac1:	48 8b 05 b8 5d 00 00 	mov    0x5db8(%rip),%rax        # c880 <tptr>
    6ac8:	48 8b 0d b1 5d 00 00 	mov    0x5db1(%rip),%rcx        # c880 <tptr>
    6acf:	48 8d 15 4a 8f 00 00 	lea    0x8f4a(%rip),%rdx        # fa20 <tpool>
    6ad6:	48 29 d1             	sub    %rdx,%rcx
    6ad9:	48 c1 f9 03          	sar    $0x3,%rcx
    6add:	48 ba ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rdx
    6ae4:	aa aa aa 
    6ae7:	48 0f af d1          	imul   %rcx,%rdx
    6aeb:	83 c2 01             	add    $0x1,%edx
    6aee:	41 89 d0             	mov    %edx,%r8d
    6af1:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
    6af5:	48 89 c2             	mov    %rax,%rdx
    6af8:	48 89 d1             	mov    %rdx,%rcx
    6afb:	48 c1 e9 03          	shr    $0x3,%rcx
    6aff:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    6b06:	0f b6 09             	movzbl (%rcx),%ecx
    6b09:	84 c9                	test   %cl,%cl
    6b0b:	40 0f 95 c6          	setne  %sil
    6b0f:	84 c9                	test   %cl,%cl
    6b11:	0f 9e c1             	setle  %cl
    6b14:	21 ce                	and    %ecx,%esi
    6b16:	41 89 f1             	mov    %esi,%r9d
    6b19:	b9 18 00 00 00       	mov    $0x18,%ecx
    6b1e:	48 83 e9 01          	sub    $0x1,%rcx
    6b22:	48 8d 34 0a          	lea    (%rdx,%rcx,1),%rsi
    6b26:	48 89 f1             	mov    %rsi,%rcx
    6b29:	48 c1 e9 03          	shr    $0x3,%rcx
    6b2d:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    6b34:	0f b6 09             	movzbl (%rcx),%ecx
    6b37:	84 c9                	test   %cl,%cl
    6b39:	41 0f 95 c2          	setne  %r10b
    6b3d:	83 e6 07             	and    $0x7,%esi
    6b40:	40 38 ce             	cmp    %cl,%sil
    6b43:	0f 9d c1             	setge  %cl
    6b46:	44 21 d1             	and    %r10d,%ecx
    6b49:	44 09 c9             	or     %r9d,%ecx
    6b4c:	84 c9                	test   %cl,%cl
    6b4e:	74 0d                	je     6b5d <create+0xef>
    6b50:	be 18 00 00 00       	mov    $0x18,%esi
    6b55:	48 89 d7             	mov    %rdx,%rdi
    6b58:	e8 13 c6 ff ff       	call   3170 <__asan_report_store_n@plt>
    6b5d:	66 0f ef c0          	pxor   %xmm0,%xmm0
    6b61:	0f 11 00             	movups %xmm0,(%rax)
    6b64:	66 0f d6 40 10       	movq   %xmm0,0x10(%rax)
    6b69:	48 89 c2             	mov    %rax,%rdx
    6b6c:	48 89 d1             	mov    %rdx,%rcx
    6b6f:	48 89 ca             	mov    %rcx,%rdx
    6b72:	48 c1 ea 03          	shr    $0x3,%rdx
    6b76:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    6b7d:	0f b6 12             	movzbl (%rdx),%edx
    6b80:	84 d2                	test   %dl,%dl
    6b82:	40 0f 95 c6          	setne  %sil
    6b86:	80 fa 03             	cmp    $0x3,%dl
    6b89:	0f 9e c2             	setle  %dl
    6b8c:	21 f2                	and    %esi,%edx
    6b8e:	84 d2                	test   %dl,%dl
    6b90:	74 08                	je     6b9a <create+0x12c>
    6b92:	48 89 cf             	mov    %rcx,%rdi
    6b95:	e8 96 c4 ff ff       	call   3030 <__asan_report_store4@plt>
    6b9a:	44 89 00             	mov    %r8d,(%rax)
    6b9d:	48 8d 50 04          	lea    0x4(%rax),%rdx
    6ba1:	48 89 d1             	mov    %rdx,%rcx
    6ba4:	48 c1 e9 03          	shr    $0x3,%rcx
    6ba8:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    6baf:	0f b6 09             	movzbl (%rcx),%ecx
    6bb2:	84 c9                	test   %cl,%cl
    6bb4:	41 0f 95 c0          	setne  %r8b
    6bb8:	48 89 d6             	mov    %rdx,%rsi
    6bbb:	83 e6 07             	and    $0x7,%esi
    6bbe:	83 c6 03             	add    $0x3,%esi
    6bc1:	40 38 ce             	cmp    %cl,%sil
    6bc4:	0f 9d c1             	setge  %cl
    6bc7:	44 21 c1             	and    %r8d,%ecx
    6bca:	84 c9                	test   %cl,%cl
    6bcc:	74 08                	je     6bd6 <create+0x168>
    6bce:	48 89 d7             	mov    %rdx,%rdi
    6bd1:	e8 5a c4 ff ff       	call   3030 <__asan_report_store4@plt>
    6bd6:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%rax)
    6bdd:	48 8d 50 10          	lea    0x10(%rax),%rdx
    6be1:	48 89 d1             	mov    %rdx,%rcx
    6be4:	48 c1 e9 03          	shr    $0x3,%rcx
    6be8:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    6bef:	0f b6 09             	movzbl (%rcx),%ecx
    6bf2:	84 c9                	test   %cl,%cl
    6bf4:	74 08                	je     6bfe <create+0x190>
    6bf6:	48 89 d7             	mov    %rdx,%rdi
    6bf9:	e8 d2 c4 ff ff       	call   30d0 <__asan_report_store8@plt>
    6bfe:	48 89 78 10          	mov    %rdi,0x10(%rax)
    6c02:	48 8b 05 77 5c 00 00 	mov    0x5c77(%rip),%rax        # c880 <tptr>
    6c09:	48 8b 15 70 5c 00 00 	mov    0x5c70(%rip),%rdx        # c880 <tptr>
    6c10:	48 8d 7a 08          	lea    0x8(%rdx),%rdi
    6c14:	48 89 c1             	mov    %rax,%rcx
    6c17:	48 8d 05 ce fd ff ff 	lea    -0x232(%rip),%rax        # 69ec <wrapper>
    6c1e:	48 89 c2             	mov    %rax,%rdx
    6c21:	be 00 00 00 00       	mov    $0x0,%esi
    6c26:	e8 45 c4 ff ff       	call   3070 <pthread_create@plt>
    6c2b:	48 8b 05 4e 5c 00 00 	mov    0x5c4e(%rip),%rax        # c880 <tptr>
    6c32:	48 83 c0 18          	add    $0x18,%rax
    6c36:	48 89 05 43 5c 00 00 	mov    %rax,0x5c43(%rip)        # c880 <tptr>
    6c3d:	90                   	nop
    6c3e:	c9                   	leave
    6c3f:	c3                   	ret

0000000000006c40 <join>:
    6c40:	55                   	push   %rbp
    6c41:	48 89 e5             	mov    %rsp,%rbp
    6c44:	48 83 ec 10          	sub    $0x10,%rsp
    6c48:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    6c4f:	e9 f0 00 00 00       	jmp    6d44 <join+0x104>
    6c54:	8b 45 f4             	mov    -0xc(%rbp),%eax
    6c57:	48 63 d0             	movslq %eax,%rdx
    6c5a:	48 89 d0             	mov    %rdx,%rax
    6c5d:	48 01 c0             	add    %rax,%rax
    6c60:	48 01 d0             	add    %rdx,%rax
    6c63:	48 c1 e0 03          	shl    $0x3,%rax
    6c67:	48 8d 15 b2 8d 00 00 	lea    0x8db2(%rip),%rdx        # fa20 <tpool>
    6c6e:	48 01 d0             	add    %rdx,%rax
    6c71:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    6c75:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6c79:	48 83 c0 04          	add    $0x4,%rax
    6c7d:	48 89 c2             	mov    %rax,%rdx
    6c80:	48 c1 ea 03          	shr    $0x3,%rdx
    6c84:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    6c8b:	0f b6 12             	movzbl (%rdx),%edx
    6c8e:	84 d2                	test   %dl,%dl
    6c90:	40 0f 95 c6          	setne  %sil
    6c94:	48 89 c1             	mov    %rax,%rcx
    6c97:	83 e1 07             	and    $0x7,%ecx
    6c9a:	83 c1 03             	add    $0x3,%ecx
    6c9d:	38 d1                	cmp    %dl,%cl
    6c9f:	0f 9d c2             	setge  %dl
    6ca2:	21 f2                	and    %esi,%edx
    6ca4:	84 d2                	test   %dl,%dl
    6ca6:	74 08                	je     6cb0 <join+0x70>
    6ca8:	48 89 c7             	mov    %rax,%rdi
    6cab:	e8 e0 c3 ff ff       	call   3090 <__asan_report_load4@plt>
    6cb0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6cb4:	8b 40 04             	mov    0x4(%rax),%eax
    6cb7:	83 f8 01             	cmp    $0x1,%eax
    6cba:	0f 85 80 00 00 00    	jne    6d40 <join+0x100>
    6cc0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6cc4:	48 83 c0 08          	add    $0x8,%rax
    6cc8:	48 89 c2             	mov    %rax,%rdx
    6ccb:	48 c1 ea 03          	shr    $0x3,%rdx
    6ccf:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    6cd6:	0f b6 12             	movzbl (%rdx),%edx
    6cd9:	84 d2                	test   %dl,%dl
    6cdb:	74 08                	je     6ce5 <join+0xa5>
    6cdd:	48 89 c7             	mov    %rax,%rdi
    6ce0:	e8 5b c4 ff ff       	call   3140 <__asan_report_load8@plt>
    6ce5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6ce9:	48 8b 40 08          	mov    0x8(%rax),%rax
    6ced:	be 00 00 00 00       	mov    $0x0,%esi
    6cf2:	48 89 c7             	mov    %rax,%rdi
    6cf5:	e8 66 c4 ff ff       	call   3160 <pthread_join@plt>
    6cfa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6cfe:	48 83 c0 04          	add    $0x4,%rax
    6d02:	48 89 c2             	mov    %rax,%rdx
    6d05:	48 c1 ea 03          	shr    $0x3,%rdx
    6d09:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    6d10:	0f b6 12             	movzbl (%rdx),%edx
    6d13:	84 d2                	test   %dl,%dl
    6d15:	40 0f 95 c6          	setne  %sil
    6d19:	48 89 c1             	mov    %rax,%rcx
    6d1c:	83 e1 07             	and    $0x7,%ecx
    6d1f:	83 c1 03             	add    $0x3,%ecx
    6d22:	38 d1                	cmp    %dl,%cl
    6d24:	0f 9d c2             	setge  %dl
    6d27:	21 f2                	and    %esi,%edx
    6d29:	84 d2                	test   %dl,%dl
    6d2b:	74 08                	je     6d35 <join+0xf5>
    6d2d:	48 89 c7             	mov    %rax,%rdi
    6d30:	e8 fb c2 ff ff       	call   3030 <__asan_report_store4@plt>
    6d35:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    6d39:	c7 40 04 02 00 00 00 	movl   $0x2,0x4(%rax)
    6d40:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    6d44:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%rbp)
    6d48:	0f 8e 06 ff ff ff    	jle    6c54 <join+0x14>
    6d4e:	90                   	nop
    6d4f:	90                   	nop
    6d50:	c9                   	leave
    6d51:	c3                   	ret

0000000000006d52 <cleanup>:
    6d52:	55                   	push   %rbp
    6d53:	48 89 e5             	mov    %rsp,%rbp
    6d56:	b8 00 00 00 00       	mov    $0x0,%eax
    6d5b:	e8 e0 fe ff ff       	call   6c40 <join>
    6d60:	90                   	nop
    6d61:	5d                   	pop    %rbp
    6d62:	c3                   	ret

0000000000006d63 <random_op>:
    6d63:	55                   	push   %rbp
    6d64:	48 89 e5             	mov    %rsp,%rbp
    6d67:	41 54                	push   %r12
    6d69:	53                   	push   %rbx
    6d6a:	48 83 ec 40          	sub    $0x40,%rsp
    6d6e:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
    6d72:	49 89 dc             	mov    %rbx,%r12
    6d75:	83 3d 64 5d 00 00 00 	cmpl   $0x0,0x5d64(%rip)        # cae0 <__asan_option_detect_stack_use_after_return@@Base>
    6d7c:	74 12                	je     6d90 <random_op+0x2d>
    6d7e:	bf 40 00 00 00       	mov    $0x40,%edi
    6d83:	e8 d8 c2 ff ff       	call   3060 <__asan_stack_malloc_0@plt>
    6d88:	48 85 c0             	test   %rax,%rax
    6d8b:	74 03                	je     6d90 <random_op+0x2d>
    6d8d:	48 89 c3             	mov    %rax,%rbx
    6d90:	48 8d 43 40          	lea    0x40(%rbx),%rax
    6d94:	48 89 c2             	mov    %rax,%rdx
    6d97:	48 c7 03 b3 8a b5 41 	movq   $0x41b58ab3,(%rbx)
    6d9e:	48 8d 05 7b 26 00 00 	lea    0x267b(%rip),%rax        # 9420 <__FUNCTION__.0+0x140>
    6da5:	48 89 43 08          	mov    %rax,0x8(%rbx)
    6da9:	48 8d 05 b3 ff ff ff 	lea    -0x4d(%rip),%rax        # 6d63 <random_op>
    6db0:	48 89 43 10          	mov    %rax,0x10(%rbx)
    6db4:	48 89 d8             	mov    %rbx,%rax
    6db7:	48 c1 e8 03          	shr    $0x3,%rax
    6dbb:	c7 80 00 80 ff 7f f1 	movl   $0xf1f1f1f1,0x7fff8000(%rax)
    6dc2:	f1 f1 f1 
    6dc5:	c7 80 04 80 ff 7f 00 	movl   $0xf3f30000,0x7fff8004(%rax)
    6dcc:	00 f3 f3 
    6dcf:	c7 42 e0 01 00 00 00 	movl   $0x1,-0x20(%rdx)
    6dd6:	8b 0d 64 5a 00 00    	mov    0x5a64(%rip),%ecx        # c840 <sz.0>
    6ddc:	48 63 c9             	movslq %ecx,%rcx
    6ddf:	48 89 4a e8          	mov    %rcx,-0x18(%rdx)
    6de3:	48 8b 72 e0          	mov    -0x20(%rdx),%rsi
    6de7:	48 8b 7a e8          	mov    -0x18(%rdx),%rdi
    6deb:	49 89 f0             	mov    %rsi,%r8
    6dee:	49 89 f9             	mov    %rdi,%r9
    6df1:	44 89 c1             	mov    %r8d,%ecx
    6df4:	48 89 fa             	mov    %rdi,%rdx
    6df7:	49 39 dc             	cmp    %rbx,%r12
    6dfa:	74 21                	je     6e1d <random_op+0xba>
    6dfc:	48 c7 03 0e 36 e0 45 	movq   $0x45e0360e,(%rbx)
    6e03:	48 bf f5 f5 f5 f5 f5 	movabs $0xf5f5f5f5f5f5f5f5,%rdi
    6e0a:	f5 f5 f5 
    6e0d:	48 89 b8 00 80 ff 7f 	mov    %rdi,0x7fff8000(%rax)
    6e14:	48 8b 43 38          	mov    0x38(%rbx),%rax
    6e18:	c6 00 00             	movb   $0x0,(%rax)
    6e1b:	eb 0b                	jmp    6e28 <random_op+0xc5>
    6e1d:	48 c7 80 00 80 ff 7f 	movq   $0x0,0x7fff8000(%rax)
    6e24:	00 00 00 00 
    6e28:	89 c8                	mov    %ecx,%eax
    6e2a:	48 83 c4 40          	add    $0x40,%rsp
    6e2e:	5b                   	pop    %rbx
    6e2f:	41 5c                	pop    %r12
    6e31:	5d                   	pop    %rbp
    6e32:	c3                   	ret

0000000000006e33 <alloc_check>:
    6e33:	55                   	push   %rbp
    6e34:	48 89 e5             	mov    %rsp,%rbp
    6e37:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    6e3b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    6e3f:	90                   	nop
    6e40:	5d                   	pop    %rbp
    6e41:	c3                   	ret

0000000000006e42 <stress_test>:
    6e42:	55                   	push   %rbp
    6e43:	48 89 e5             	mov    %rsp,%rbp
    6e46:	41 54                	push   %r12
    6e48:	53                   	push   %rbx
    6e49:	48 83 ec 40          	sub    $0x40,%rsp
    6e4d:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
    6e51:	83 3d 88 5c 00 00 00 	cmpl   $0x0,0x5c88(%rip)        # cae0 <__asan_option_detect_stack_use_after_return@@Base>
    6e58:	74 12                	je     6e6c <stress_test+0x2a>
    6e5a:	bf 40 00 00 00       	mov    $0x40,%edi
    6e5f:	e8 fc c1 ff ff       	call   3060 <__asan_stack_malloc_0@plt>
    6e64:	48 85 c0             	test   %rax,%rax
    6e67:	74 03                	je     6e6c <stress_test+0x2a>
    6e69:	48 89 c3             	mov    %rax,%rbx
    6e6c:	48 8d 43 40          	lea    0x40(%rbx),%rax
    6e70:	49 89 c4             	mov    %rax,%r12
    6e73:	48 c7 03 b3 8a b5 41 	movq   $0x41b58ab3,(%rbx)
    6e7a:	48 8d 05 b3 25 00 00 	lea    0x25b3(%rip),%rax        # 9434 <__FUNCTION__.0+0x154>
    6e81:	48 89 43 08          	mov    %rax,0x8(%rbx)
    6e85:	48 8d 05 b6 ff ff ff 	lea    -0x4a(%rip),%rax        # 6e42 <stress_test>
    6e8c:	48 89 43 10          	mov    %rax,0x10(%rbx)
    6e90:	48 89 d8             	mov    %rbx,%rax
    6e93:	48 c1 e8 03          	shr    $0x3,%rax
    6e97:	c7 80 00 80 ff 7f f1 	movl   $0xf1f1f1f1,0x7fff8000(%rax)
    6e9e:	f1 f1 f1 
    6ea1:	c7 80 04 80 ff 7f 00 	movl   $0xf3f30000,0x7fff8004(%rax)
    6ea8:	00 f3 f3 
    6eab:	b8 00 00 00 00       	mov    $0x0,%eax
    6eb0:	e8 ae fe ff ff       	call   6d63 <random_op>
    6eb5:	89 c1                	mov    %eax,%ecx
    6eb7:	48 89 d0             	mov    %rdx,%rax
    6eba:	41 89 4c 24 e0       	mov    %ecx,-0x20(%r12)
    6ebf:	49 89 44 24 e8       	mov    %rax,-0x18(%r12)
    6ec4:	41 8b 44 24 e0       	mov    -0x20(%r12),%eax
    6ec9:	83 f8 01             	cmp    $0x1,%eax
    6ecc:	75 dd                	jne    6eab <stress_test+0x69>
    6ece:	49 8b 5c 24 e8       	mov    -0x18(%r12),%rbx
    6ed3:	48 8d 05 46 4c 00 00 	lea    0x4c46(%rip),%rax        # bb20 <pmm>
    6eda:	48 89 c2             	mov    %rax,%rdx
    6edd:	48 c1 ea 03          	shr    $0x3,%rdx
    6ee1:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    6ee8:	0f b6 12             	movzbl (%rdx),%edx
    6eeb:	84 d2                	test   %dl,%dl
    6eed:	74 08                	je     6ef7 <stress_test+0xb5>
    6eef:	48 89 c7             	mov    %rax,%rdi
    6ef2:	e8 49 c2 ff ff       	call   3140 <__asan_report_load8@plt>
    6ef7:	48 8b 05 22 4c 00 00 	mov    0x4c22(%rip),%rax        # bb20 <pmm>
    6efe:	48 8d 50 08          	lea    0x8(%rax),%rdx
    6f02:	48 89 d1             	mov    %rdx,%rcx
    6f05:	48 c1 e9 03          	shr    $0x3,%rcx
    6f09:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    6f10:	0f b6 09             	movzbl (%rcx),%ecx
    6f13:	84 c9                	test   %cl,%cl
    6f15:	74 08                	je     6f1f <stress_test+0xdd>
    6f17:	48 89 d7             	mov    %rdx,%rdi
    6f1a:	e8 21 c2 ff ff       	call   3140 <__asan_report_load8@plt>
    6f1f:	48 8b 50 08          	mov    0x8(%rax),%rdx
    6f23:	49 8b 44 24 e8       	mov    -0x18(%r12),%rax
    6f28:	48 89 c7             	mov    %rax,%rdi
    6f2b:	ff d2                	call   *%rdx
    6f2d:	48 89 de             	mov    %rbx,%rsi
    6f30:	48 89 c7             	mov    %rax,%rdi
    6f33:	e8 fb fe ff ff       	call   6e33 <alloc_check>
    6f38:	90                   	nop
    6f39:	e9 6d ff ff ff       	jmp    6eab <stress_test+0x69>

0000000000006f3e <main>:
    6f3e:	55                   	push   %rbp
    6f3f:	48 89 e5             	mov    %rsp,%rbp
    6f42:	48 83 ec 10          	sub    $0x10,%rsp
    6f46:	48 8d 05 73 4f 00 00 	lea    0x4f73(%rip),%rax        # bec0 <os>
    6f4d:	48 89 c2             	mov    %rax,%rdx
    6f50:	48 c1 ea 03          	shr    $0x3,%rdx
    6f54:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    6f5b:	0f b6 12             	movzbl (%rdx),%edx
    6f5e:	84 d2                	test   %dl,%dl
    6f60:	74 08                	je     6f6a <main+0x2c>
    6f62:	48 89 c7             	mov    %rax,%rdi
    6f65:	e8 d6 c1 ff ff       	call   3140 <__asan_report_load8@plt>
    6f6a:	48 8b 05 4f 4f 00 00 	mov    0x4f4f(%rip),%rax        # bec0 <os>
    6f71:	48 89 c2             	mov    %rax,%rdx
    6f74:	48 89 d1             	mov    %rdx,%rcx
    6f77:	48 c1 e9 03          	shr    $0x3,%rcx
    6f7b:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    6f82:	0f b6 09             	movzbl (%rcx),%ecx
    6f85:	84 c9                	test   %cl,%cl
    6f87:	74 08                	je     6f91 <main+0x53>
    6f89:	48 89 d7             	mov    %rdx,%rdi
    6f8c:	e8 af c1 ff ff       	call   3140 <__asan_report_load8@plt>
    6f91:	48 8b 10             	mov    (%rax),%rdx
    6f94:	b8 00 00 00 00       	mov    $0x0,%eax
    6f99:	ff d2                	call   *%rdx
    6f9b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    6fa2:	eb 13                	jmp    6fb7 <main+0x79>
    6fa4:	48 8d 05 97 fe ff ff 	lea    -0x169(%rip),%rax        # 6e42 <stress_test>
    6fab:	48 89 c7             	mov    %rax,%rdi
    6fae:	e8 bb fa ff ff       	call   6a6e <create>
    6fb3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    6fb7:	83 7d fc 03          	cmpl   $0x3,-0x4(%rbp)
    6fbb:	7e e7                	jle    6fa4 <main+0x66>
    6fbd:	b8 00 00 00 00       	mov    $0x0,%eax
    6fc2:	c9                   	leave
    6fc3:	c3                   	ret

0000000000006fc4 <_sub_D_00099_0>:
    6fc4:	55                   	push   %rbp
    6fc5:	48 89 e5             	mov    %rsp,%rbp
    6fc8:	be 07 00 00 00       	mov    $0x7,%esi
    6fcd:	48 8d 05 4c 59 00 00 	lea    0x594c(%rip),%rax        # c920 <tptr+0xa0>
    6fd4:	48 89 c7             	mov    %rax,%rdi
    6fd7:	e8 04 c1 ff ff       	call   30e0 <__asan_unregister_globals@plt>
    6fdc:	5d                   	pop    %rbp
    6fdd:	c3                   	ret

0000000000006fde <_sub_I_00099_1>:
    6fde:	55                   	push   %rbp
    6fdf:	48 89 e5             	mov    %rsp,%rbp
    6fe2:	e8 19 c1 ff ff       	call   3100 <__asan_init@plt>
    6fe7:	e8 64 c1 ff ff       	call   3150 <__asan_version_mismatch_check_v8@plt>
    6fec:	be 07 00 00 00       	mov    $0x7,%esi
    6ff1:	48 8d 05 28 59 00 00 	lea    0x5928(%rip),%rax        # c920 <tptr+0xa0>
    6ff8:	48 89 c7             	mov    %rax,%rdi
    6ffb:	e8 50 c0 ff ff       	call   3050 <__asan_register_globals@plt>
    7000:	5d                   	pop    %rbp
    7001:	c3                   	ret

Disassembly of section .fini:

0000000000007004 <_fini>:
    7004:	f3 0f 1e fa          	endbr64
    7008:	48 83 ec 08          	sub    $0x8,%rsp
    700c:	48 83 c4 08          	add    $0x8,%rsp
    7010:	c3                   	ret
