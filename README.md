# Estimate First — قدّر أولاً ⏱️🔢

أداة لـ **Claude** و **Claude Code**: قبل ما يبدأ كلود أي مهمة، يعطيك تقدير تقريبي لـ:

- ⏱️ الوقت اللي راح تاخذه المهمة
- 🔢 عدد التوكنز التقريبي
- 📊 مستوى الاستهلاك من باقتك (منخفض / متوسط / عالي)

وبعدها يسألك: **توافق أبدأ؟** — وما يبدأ إلا بعد موافقتك.

```
📋 تقدير المهمة
المهمة: بناء صفحة هبوط بسيطة
الخطوات: تخطيط الصفحة ← كتابة HTML/CSS ← مراجعة على الجوال
⏱️ الوقت المتوقع: 3–6 دقائق
🔢 التوكنز التقريبية: 25K–50K
📊 الاستهلاك: منخفض
توافق أبدأ؟ (نعم / لا / مختصر)
```

> ⚠️ الأرقام تقديرية وتقريبية، مو دقيقة. الهدف إنك تعرف حجم المهمة قبل ما تصرف عليها.

---

## التركيب على Claude Code

داخل Claude Code اكتب:

```
/plugin marketplace add moathmalawadhi-lab/estimate-first
/plugin install estimate-first@estimate-first
```

بعد التركيب:
- يشتغل تلقائياً مع كل طلب.
- `/estimate <المهمة>` يعطيك تقدير بدون ما يبدأ.
- تبي تتخطاه مرة وحدة؟ اكتب **"بدون تقدير"** أو **"skip estimate"** في رسالتك.
- تبي توقفه مؤقتاً؟ `export ESTIMATE_FIRST_OFF=1` قبل تشغيل Claude Code.

## التركيب على Claude (الموقع والتطبيق)

1. نزّل ملف `estimate-first-skill.zip` من هذا المستودع.
2. في Claude: **Settings ← Capabilities ← Skills** وارفع الملف.
3. فعّل السكل، وكلود راح يقدّر قبل كل مهمة.
4. **(مهم — عشان تشتغل تلقائياً في كل محادثة):** روح **Settings ← Profile**، وفي خانة التعليمات الشخصية (Personal preferences) حط هالسطر:
   ```
   قبل أي مهمة، استخدم سكل estimate-first واعطني التقدير وانتظر موافقتي.
   ```
   كذا ما تحتاج تطلبها كل مرة.

---

## English

**Estimate First** makes Claude and Claude Code stop before any task and show a rough estimate of time, tokens and usage level, then ask you to approve or reject. Nothing starts until you say yes.

### Install in Claude Code
```
/plugin marketplace add moathmalawadhi-lab/estimate-first
/plugin install estimate-first@estimate-first
```
- Runs automatically on every prompt (via a `UserPromptSubmit` hook).
- `/estimate <task>` — estimate only, don't start.
- Add "skip estimate" to a prompt to skip once; set `ESTIMATE_FIRST_OFF=1` to disable.

### Install in Claude (web / app)
Download `estimate-first-skill.zip` from this repo and upload it under **Settings → Capabilities → Skills**.

To make it run automatically in every chat, add this line to **Settings → Profile → Personal preferences**:
```
Before any task, use the estimate-first skill, give me the estimate, and wait for my approval.
```

### Note
Estimates are approximate, based on rules of thumb in `skills/estimate-first/SKILL.md`. Claude cannot read your plan's exact remaining usage, so it gives ranges, not exact numbers. Feel free to tune the numbers in that file.

## Structure
```
.claude-plugin/plugin.json        plugin manifest
.claude-plugin/marketplace.json   lets people add this repo as a marketplace
skills/estimate-first/SKILL.md    the estimating rules (works in Claude & Claude Code)
hooks/hooks.json + remind.sh      auto-reminder on every prompt (Claude Code)
commands/estimate.md              /estimate command
```

## License
MIT — Moath Alawadhi
