cmd_/home/ubuntu20/my_drv_test/03_two_drv_dependence/drv_a/drv_a.o := arm-buildroot-linux-gnueabihf-gcc -Wp,-MD,/home/ubuntu20/my_drv_test/03_two_drv_dependence/drv_a/.drv_a.o.d  -nostdinc -isystem /home/ubuntu20/100ask_imx6ull_mini-sdk/ToolChain/arm-buildroot-linux-gnueabihf_sdk-buildroot/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/7.5.0/include -I/home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include -I./arch/arm/include/generated -I/home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include -I./include -I/home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi -I./include/generated/uapi -include /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/kconfig.h -include /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Wno-format-security -std=gnu89 -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mfpu=vfp -funwind-tables -marm -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -O2 --param=allow-store-data-races=0 -Wframe-larger-than=1024 -fstack-protector-strong -Wno-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-variable -fomit-frame-pointer -fno-var-tracking-assignments -g -fno-inline-functions-called-once -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -fno-strict-overflow -fno-merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init  -DMODULE  -DKBUILD_BASENAME='"drv_a"' -DKBUILD_MODNAME='"drv_a"' -c -o /home/ubuntu20/my_drv_test/03_two_drv_dependence/drv_a/drv_a.o /home/ubuntu20/my_drv_test/03_two_drv_dependence/drv_a/drv_a.c

source_/home/ubuntu20/my_drv_test/03_two_drv_dependence/drv_a/drv_a.o := /home/ubuntu20/my_drv_test/03_two_drv_dependence/drv_a/drv_a.c

deps_/home/ubuntu20/my_drv_test/03_two_drv_dependence/drv_a/drv_a.o := \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/kconfig.h \
    $(wildcard include/config/cpu/big/endian.h) \
    $(wildcard include/config/booger.h) \
    $(wildcard include/config/foo.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/compiler_types.h \
    $(wildcard include/config/have/arch/compiler/h.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/cc/has/asm/inline.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/compiler_attributes.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/compiler-gcc.h \
    $(wildcard include/config/retpoline.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/export.h \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/have/arch/prel32/relocations.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/module.h \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tree/srcu.h) \
    $(wildcard include/config/bpf/events.h) \
    $(wildcard include/config/jump/label.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/function/error/injection.h) \
    $(wildcard include/config/strict/module/rwx.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/types.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/uapi/asm/types.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/int-ll64.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/uapi/asm/bitsperlong.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitsperlong.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/asm-generic/bitsperlong.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/posix_types.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/stddef.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/stddef.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/compiler_types.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/uapi/asm/posix_types.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/asm-generic/posix_types.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/const.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/const.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/arch/has/refcount.h) \
    $(wildcard include/config/panic/timeout.h) \
  /home/ubuntu20/100ask_imx6ull_mini-sdk/ToolChain/arm-buildroot-linux-gnueabihf_sdk-buildroot/lib/gcc/arm-buildroot-linux-gnueabihf/7.5.0/include/stdarg.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/limits.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/limits.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/linkage.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/stringify.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/linkage.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arm/heavy/mb.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
    $(wildcard include/config/cpu/spectre.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/barrier.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/kasan-checks.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/bitops.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/bits.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/bitops.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/typecheck.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/irqflags.h \
    $(wildcard include/config/cpu/v7m.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/hwcap.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/uapi/asm/hwcap.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/irqflags.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/non-atomic.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/builtin-__fls.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/builtin-__ffs.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/builtin-fls.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/builtin-ffs.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/ffz.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/fls64.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/sched.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/hweight.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/arch_hweight.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/const_hweight.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/lock.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/atomic.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
    $(wildcard include/config/arm/lpae.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/prefetch.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/binfmt/elf/fdpic.h) \
    $(wildcard include/config/arm/errata/754327.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/hw_breakpoint.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/unified.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/cmpxchg.h \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/v6.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/cmpxchg-local.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/atomic-fallback.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/atomic-long.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/le.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/uapi/asm/byteorder.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/byteorder/little_endian.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/byteorder/little_endian.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/swab.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/swab.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/swab.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/uapi/asm/swab.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/byteorder/generic.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/quiet.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/init.h \
    $(wildcard include/config/strict/kernel/rwx.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/kern_levels.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/kernel.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/sysinfo.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/dynamic_debug.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/build_bug.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/div64.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/compiler.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/div64.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/stat.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/uapi/asm/stat.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/stat.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/seqlock.h \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/preemption.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/trace/preempt/toggle.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  arch/arm/include/generated/asm/preempt.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/preempt.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/thread_info.h \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/bug.h \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/cpu/endian/be32.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/restart_block.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/time64.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/time.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/time_types.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/stackprotector/per/task.h) \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/glue.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/pgtable-2level-types.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/xip/kernel.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/xip/phys/addr.h) \
    $(wildcard include/config/debug/virtual.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/sizes.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/pfn.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/getorder.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/bottom_half.h \
  arch/arm/include/generated/asm/mmiowb.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/mmiowb.h \
    $(wildcard include/config/mmiowb.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/spinlock_types.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/spinlock_types.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/rwlock_types.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/spinlock.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/rwlock.h \
    $(wildcard include/config/preempt.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
    $(wildcard include/config/generic/lockbreak.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/time32.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/timex.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/timex.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/param.h \
  arch/arm/include/generated/uapi/asm/param.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/asm-generic/param.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/timex.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/highuid.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/kmod.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/umh.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/contig/alloc.h) \
    $(wildcard include/config/cma.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/shuffle/page/allocator.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/wait.h \
  arch/arm/include/generated/asm/current.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/current.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/wait.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/nodemask.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/bitmap.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/string.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/string.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/page-flags-layout.h \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/kasan/sw/tags.h) \
  include/generated/bounds.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/mm_types.h \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/mm_types_task.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/auxvec.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/auxvec.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/auxvec.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/uapi/asm/auxvec.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/rbtree.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/rcupdate.h \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/rcutree.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/debug/rwsems.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/err.h \
  arch/arm/include/generated/uapi/asm/errno.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/asm-generic/errno.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/asm-generic/errno-base.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/osq_lock.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/completion.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/uprobes.h \
    $(wildcard include/config/uprobes.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/errno.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/errno.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/uprobes.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/probes.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/preempt/rt.h) \
    $(wildcard include/config/no/hz/common.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/ktime.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/jiffies.h \
  include/generated/timeconst.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/timekeeping.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/timekeeping32.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
    $(wildcard include/config/vdso.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/page-flags.h \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/idle/page/tracking.h) \
    $(wildcard include/config/thp/swap.h) \
    $(wildcard include/config/ksm.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/notifier.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
    $(wildcard include/config/debug/mutexes.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
    $(wildcard include/config/srcu.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/rcu_segcblist.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/srcutree.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/rcu_node_tree.h \
    $(wildcard include/config/rcu/fanout.h) \
    $(wildcard include/config/rcu/fanout/leaf.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/arch_topology.h \
    $(wildcard include/config/generic/arch/topology.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/smp.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/percpu.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/percpu.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/topology.h \
    $(wildcard include/config/arm/cpu/topology.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/topology.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/sysctl.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/elf.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/elf.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/vdso_datapage.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/user.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/elf.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/uapi/linux/elf-em.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/sysfs.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/idr.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/radix-tree.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/xarray.h \
    $(wildcard include/config/xarray/multi.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/kconfig.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/kobject_ns.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/kref.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/refcount.h \
    $(wildcard include/config/refcount/full.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/jump_label.h \
    $(wildcard include/config/have/arch/jump/label/relative.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/rbtree_latch.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/error-injection.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/error-injection.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/tracepoint-defs.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/linux/static_key.h \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/arch/arm/include/asm/module.h \
    $(wildcard include/config/arm/unwind.h) \
    $(wildcard include/config/arm/module/plts.h) \
  /home/ubuntu20/STM32MP157_SDK/MYiR-STM32-kernel/myir-st-linux/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \

/home/ubuntu20/my_drv_test/03_two_drv_dependence/drv_a/drv_a.o: $(deps_/home/ubuntu20/my_drv_test/03_two_drv_dependence/drv_a/drv_a.o)

$(deps_/home/ubuntu20/my_drv_test/03_two_drv_dependence/drv_a/drv_a.o):
