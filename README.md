# ⏱️ قدّر أولاً — Estimate First لـ Claude

**قبل ما يبدأ كلود أي مهمة، يعطيك تقدير لحجمها ويستنى موافقتك.** كذا تعرف كم بتاخذ من وقتك ومن باقتك قبل ما تصرف عليها.

---

## 🎯 وش يسوي لك؟

قبل أي مهمة، يطلع لك تقدير لـ:

- ⏱️ **الوقت** اللي بتاخذه المهمة
- 🔢 **عدد التوكنز** التقريبي
- 📊 **مستوى الاستهلاك** من باقتك: منخفض أو متوسط أو عالي

وبعدها يسألك: **توافق أبدأ؟** وما يبدأ أي شي إلا بعد موافقتك.

### 📋 مثال

> **📋 تقدير المهمة**  
> **المهمة:** بناء صفحة هبوط بسيطة  
> **الخطوات:** تخطيط الصفحة ← كتابة الكود ← مراجعة على التلفون  
> **⏱️ الوقت المتوقع:** من ٣ إلى ٦ دقائق  
> **🔢 التوكنز التقريبية:** من ٢٥ ألف إلى ٥٠ ألف  
> **📊 الاستهلاك:** منخفض  
> **توافق أبدأ؟** (نعم / لا / مختصر)

> ⚠️ الأرقام تقديرية مو دقيقة، لأن كلود ما يقدر يشوف الباقي من باقتك بالضبط. الهدف إنك تعرف حجم المهمة قبل ما تبدأ.

---

## ✅ المتطلبات قبل ما تبدأ

| المطلوب | التفاصيل |
|---|---|
| 💳 الاشتراك | المهارات متاحة في كل الباقات، بما فيها المجانية |
| ⚙️ الإعداد | لازم يكون **Code execution and file creation** مفعّل في إعدادات كلود ← **Capabilities** |

---

## 🔧 التركيب على Claude (الموقع أو التطبيق)

### 1️⃣ نزّل المهارة

**[⬇️ estimate-first-skill.zip](https://github.com/moathmalawadhi-lab/estimate-first/raw/main/estimate-first-skill.zip)**

> ⚠️ لا تستخدم زر **Code → Download ZIP**، لأن اسم المجلد اللي ينزل منه ما يطابق اسم المهارة، وكلود بيرفضه.

### 2️⃣ ارفعها في كلود

1. افتح **Customize → Skills** (أو على طول: [claude.ai/customize/skills](https://claude.ai/customize/skills)).
2. اضغط زر **+**، وبعدها **Create skill**.
3. اختر **Upload a skill**، وارفع الملف.
4. فعّل المهارة من الزر اللي جنبها.

### 3️⃣ خلّها تشتغل تلقائياً في كل محادثة

1. اضغط على اسمك تحت على اليسار، وبعدها **Settings**.
2. اختر **Your Claude**.
3. في خانة **Instructions** حط هذا السطر:

```
قبل أي مهمة، استخدم سكل estimate-first واعطني التقدير وانتظر موافقتي.
```

كذا ما تحتاج تطلبها كل مرة.

---

## 💻 التركيب على Claude Code

داخل Claude Code اكتب:

```
/plugin marketplace add moathmalawadhi-lab/estimate-first
```

```
/plugin install estimate-first@estimate-first
```

واختر **Install for you**.

بعد التركيب:

| تبي | سوّ كذا |
|---|---|
| ▶️ يشتغل لحاله | يشتغل تلقائياً مع كل طلب |
| 🔍 تقدير بدون ما يبدأ | `/estimate <المهمة>` |
| ⏭️ تتخطاه مرة وحدة | اكتب **"بدون تقدير"** أو **"skip estimate"** في رسالتك |
| ⏸️ توقفه مؤقتاً | `export ESTIMATE_FIRST_OFF=1` قبل تشغيل Claude Code |

---

## 🛠️ إذا صار شي

| المشكلة | الحل |
|---|---|
| ❌ كلود رفض ملف الـ ZIP | نزّل الملف من الرابط فوق، مو من زر Download ZIP |
| 😶 ما يطلع التقدير | تأكد إن المهارة مفعّلة في **Customize → Skills**، وإنك حاطّ سطر التعليمات في الخطوة 3 |
| 🙈 المهارة ما تشتغل أبداً | تأكد إن **Code execution and file creation** مفعّل |

---

## 📁 محتويات المستودع

| الملف أو المجلد | وش فيه |
|---|---|
| `estimate-first-skill.zip` | ملف جاهز للرفع في موقع كلود |
| `skills/estimate-first/SKILL.md` | قواعد التقدير (تشتغل في كلود وكلود كود) |
| `.claude-plugin/plugin.json` | ملف الإضافة |
| `.claude-plugin/marketplace.json` | يخلي الناس يضيفون المستودع كسوق إضافات |
| `hooks/hooks.json` و`remind.sh` | تذكير تلقائي مع كل طلب (كلود كود) |
| `commands/estimate.md` | أمر `/estimate` |

---

## English

**Estimate First** makes Claude and Claude Code stop before any task and show a rough estimate of time, tokens and usage level, then ask you to approve or reject. Nothing starts until you say yes.

### Install in Claude (web / app)
1. Download **[estimate-first-skill.zip](https://github.com/moathmalawadhi-lab/estimate-first/raw/main/estimate-first-skill.zip)** (not GitHub's *Download ZIP*: its folder name won't match the skill name).
2. Go to **Customize → Skills**, click **+ → Create skill → Upload a skill**, upload the file and turn it on.
3. To make it run in every chat: click your initials (bottom-left) → **Settings → Your Claude**, and under **Instructions** add:
   ```
   Before any task, use the estimate-first skill, give me the estimate, and wait for my approval.
   ```

Requires **Code execution and file creation** to be on (**Settings → Capabilities**).

### Install in Claude Code
```
/plugin marketplace add moathmalawadhi-lab/estimate-first
/plugin install estimate-first@estimate-first
```
- Runs automatically on every prompt (via a `UserPromptSubmit` hook).
- `/estimate <task>`: estimate only, don't start.
- Add "skip estimate" to a prompt to skip once; set `ESTIMATE_FIRST_OFF=1` to disable.

### Note
Estimates are approximate, based on rules of thumb in `skills/estimate-first/SKILL.md`. Claude cannot read your plan's exact remaining usage, so it gives ranges, not exact numbers. Feel free to tune the numbers in that file.

## License
MIT — Moath Alawadhi
