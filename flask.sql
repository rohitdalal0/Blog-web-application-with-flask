-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 13, 2020 at 02:42 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flask`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `No` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Message` text NOT NULL,
  `Date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `No` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `No` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Body` text NOT NULL,
  `Tag` text NOT NULL,
  `Like` int(11) DEFAULT '0',
  `Url` text NOT NULL,
  `Date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`No`, `Title`, `Body`, `Tag`, `Like`, `Un-like`, `Url`, `Date`) VALUES
(1, 'Private banks lag PSU, foreign lenders in passing on rate cut benefits to borrowers.', 'Private banks were the slowest to pass on the benefits of falling interest rates to their customers in 2019 compared to their state-run and foreign rivals, Reserve Bank of India (RBI) data showed.\r\n\r\nThe median one-year marginal cost of funds-based lending rate (MCLR) for private banks fell a meagre 12 basis points (bps) to 9.18% between January and December 2019, compared to RBI’s cumulative 135 bps cut in its key policy rate to 5.15%. Most bank loans are typically priced over the one-year MCLR, making it the most tracked rate.\r\n\r\nGraphic by Sarvesh Kumar Sharma/Mint \r\nGraphic by Sarvesh Kumar Sharma/Mint\r\n\r\nIn the same period, state-run banks have lowered their one-year median MCLR by 45 bps and foreign banks have cut their lending rates by 75 bps. Foreign banks have the lowest median one-year MCLR rate at 7.9% as of December. Their public counterparts are at 8.3%. For all scheduled commercial banks taken together, the one-year median rate stands at 8.3%.\r\n\r\nThe reason private banks are less eager to cut interest rates lies in their cost of funds. They pay the highest interest to their depositors. Private lenders are followed by public sector and foreign banks, respectively. While private banks paid depositors 6.91% interest in November 2019 (latest data), public sector banks paid 6.65% and foreign banks 5.38%, according to RBI data on weighted average deposit rates.\r\n\r\n\r\n“To look at the transmission of rates by these banks, one must also look at how their cost of funds has changed over time,\" said Anil Gupta, vice president and sector head of financial sector ratings at ICRA Ltd. “For public sector banks, credit growth is slow and, therefore, the need to aggressively mobilize deposits by offering a higher interest rate to deposits is little. Accordingly, the deposit rates for private sector banks remain higher.\"\r\n\r\nAccording to Gupta, foreign banks, however, pay depositors less than what other categories of banks do and, therefore, their lending rates are among the cheapest. “One factor behind it is foreign banks’ limited retail franchises and the presence of large deposits from multinational corporations, which keep their money in the same bank across the world. Hence, in the absence of retail depositors, the need to offer higher deposit rates to attract retail deposits is lower than other banks. These MNCs also maintain large current account deposits instead of term deposits, leading to lower cost of deposits,\" added Gupta.\r\n\r\n\r\nSince banks began pricing all fresh retail and small business loans to an external benchmark in October, the one-year median MCLR has dropped 5 bps for all categories of lenders.\r\n\r\nThe process of setting interest rates by banks is at the core of transmission and the central bank has for several years been trying to make it more transparent. This has led to the change from benchmark prime lending rate (BPLR) to base rate to MCLR and finally to external benchmark-based lending rates.\r\n\r\nApart from the median one-year MCLR rate, the regulator also publishes a weighted average lending rate on fresh and outstanding bank loans. Some believe that the weighted average rate should be followed more closely than the median rate.\r\n\r\n\r\nThe weighted average data on fresh loans also shows that private banks still lag their peers in transmission. While private banks lowered their rates by 48 bps in 2018, based on weighted average data, public and foreign banks lowered their rates by 56 bps and 86 bps, respectively.\r\n\r\n“Undoubtedly, there has been a reduction in lending rates for both private and public sector banks if you look at the data on weighted average lending rate published by RBI,\" said Krishnan Sitaraman, senior director at Crisil Ratings.\r\n\r\n“However, the trend in the median lending rates of private banks as a category is somewhat different from the trend in weighted average lending rates because the reduction in the cost of funds for larger and stronger private banks has been higher. Therefore, the lending rate reduction for them has been higher as compared to some of the smaller private banks,\" said Sitaraman.', 'business, money, life', 234, '/static/img/img1.jpg', 'January 10, 2020'),
(2, 'Govt must end Yes Bank’s theater of the absurd', 'Before it results in a tragedy for all of India’s banking, regulators need to step in and end the farce called Yes Bank Ltd. The latest shenanigans make it very clear that the authorities need to stop being spectators — and act. \r\n\r\nThe original cast has vanished. The co-founder who drove the country’s fifth largest private-sector bank into a ditch of bad corporate loans has sold out. Institutional shareholders are heading for the exit. Retail investors left holding more and more of the stock are waiting for lifesaving capital. The new management keeps dangling improbable funding options — ranging from an unnamed global technology firm to a Canadian businessman living in a motel — only to strike them off the list of white knights. \r\n\r\nThe only thing ticking at the bank is the clock. Common equity tier 1 may just about manage to stay above the regulatory threshold of 8% by March. But 36% of capital is tied up in bad debt that’s yet to be provided for. More loan losses lie around the corner. With 40% of deposits coming from fickle wholesale sources, solvency and liquidity risks are high. \r\n\r\n\r\nAt a time when India’s financial system is choking on hundreds of billions of dollars of bad loans, the news coming out of Yes still manages to shake confidence.On Friday, the lender announced that the head of the board’s audit committee, appointed under previous management, had quit. Following whistle-blower allegations of undisclosed past criminal cases, the bank was examining whether Uttam Prakash Agarwal was “fit and proper\" to be a director.\r\n\r\nBut Agarwal, who says the missed disclosures were an omission, pulled the trigger first. In a letter, he called for a forensic audit of the fundraising process — and its communication to the board and the public — to probe if it was “false, misleading or distorted.\" The stock, down 88% over the past 17 months, fell more than 5% on Friday. \r\n\r\nFollowing Agarwal’s salvo, the only way Chief Executive Officer Ravneet Gill can salvage the situation and his own reputation is by quickly raising around 3% of risk-weighted assets worth of capital. That’s a bare minimum. Yet after nearly a year in the job, the ex-Deutsche Bank AG veteran has little to show for his efforts. Most recently, the board ruled out taking money from Erwin Braich, the mysterious Canadian investor. And that, as far as one can see, is the end of the road in Gill’s search for an investor who will write a check in excess of $1 billion for a lender that’s still hurtling down a rabbit hole.\r\n\r\n\r\nAn independent existence for Yes is increasingly unrealistic. There’s no safe way to shut it down without inviting system-wide panic. Depositors are already on the edge, trapped in a cooperative bank that failed. What else can be done?I’ve previously explored the possibility of a merger with Kotak Mahindra Bank Ltd., which like Yes is also a private-sector lender. But Chairman Uday Kotak, whose good fortune has been all about saying no to loans to which Yes said yes, seems uninterested.\r\n\r\nState Bank of India, India’s largest commercial lender by assets, may hate the idea of a forced merger. But let’s face it: No other banking balance sheet in India might be able to take over a lender with more than $31 billion in advances. More importantly, the SBI is a public-sector bank; if CEO Rajnish Kumar can be prevailed upon to swallow Yes, he can always be given some taxpayers’ funds to help with the indigestion.\r\n\r\n\r\nTime is not on India’s side. Nominal GDP is expanding at its slowest in more than four decades. An implosion at the bank will be awful news for construction, real-estate and shadow banking, three crucial sectors starved of funding that comprise a quarter of Yes Bank’s loan book. This negative feedback loop could be more damaging to confidence than even the surprise bankruptcy of infrastructure financier IL&FS Group in September 2018, which led to an economy-wide surge in borrowing costs.\r\n\r\nAfter Agarwal’s letter to the stock exchanges, the regulator and the government, none can pretend to be in the dark any longer about the state of affairs at Yes Bank. It’s time they brought the curtain down on this theater of the absurd.', 'business, money, life', 43, '/static/img/img2.jpg', 'January 10, 2020'),
(3, 'Disproved charges may still have a bearing on Infosys’ valuation', 'he Reserve Bank of India has provisionally licensed over half a dozen account aggregators, including Jio Information Solutions, part of Mukesh Ambani’s Reliance Group, and NESL Asset Data, an entity set up by a consortium of the country’s biggest banks. Several have completed trials on the system already.\r\n\r\nAt the same time, Sahamati is working to convince financial institutions to embrace the new system. Later this month, it’s scheduled a demonstration to encourage tech startups to develop compatible apps. Already the State Bank of India, ICICI Bank, Kotak Mahindra Bank, and Axis Bank have signed on and are testing the system. So have the country’s leading financial regulators.\r\n\r\nThey also need to make sure people use it. India’s credit rating system is relatively new and covers only a tiny fraction of the population. The paperwork and documentation required to apply for a loan has deterred both small borrowers and prospective lenders. The account aggregators solve that problem -- potentially.\r\n\r\n\r\n“We have to ensure that hundreds of millions of Indians with varying levels of education and literacy properly understand consent,\" said V.R. Govindarajan, co-founder and CEO of financial data verifier Perfios, which has received an account aggregator license. “It’s a work in progress and for the system to gain mass adoption, we need to evangelize.\"', 'business, money, life', 40, '/static/img/img3.jpg', 'January 10, 2020'),
(4, 'Soon you can share income tax return, other details easily for bank loans, accounts.', 'BENGALURU : India has more than 560 million internet users, all generating data by the terabyte. Soon they’ll have an unprecedented amount of control over their digital financial footprints, with the ability to decide what to share, with whom, and for how long.\r\n\r\nIndia’s top banks are getting ready to roll out a system that gives consumers access to a wide swath of their financial data and allows them to share it instantly. Backed by the Reserve Bank of India, it’s an ambitious approach that combines privacy protection with credit reporting: if it works, it could unlock the credit market for millions of Indians while offering new levels of data security and consumer control.\r\n\r\nIndia’s effort is one of a handful of initiatives around the globe to return control of data to consumers, notably with the “open banking\" movement in Europe and Australia. India’s approach is unique -- it relies on third parties to mediate the often complicated process of information sharing -- and so is its target population, which is predominantly poor and, as of now, excluded from the formal banking system.\r\n\r\n\r\n“Only India has a solution for such a scale,\" said Infosys chairman Nandan Nilekani, who’s been an adviser to this initiative and other major tech reforms. “This is the future.\"\r\n\r\nHow it works\r\n\r\nThe “account aggregator\" system will be offered by banks and licensed by India’s central bank, which will also regulate the data collection and sharing. By logging into authorized apps, users will be able to pull together all kinds of financial data -- spending patterns, bill repayment, tax returns, business transactions -- that they can then choose to share instantly and temporarily in pursuit of loans, investment products or even insurance.\r\n\r\nA prospective borrower might, for example, release part of his goods-and-services tax filings to convince a lender of credit-worthiness. A vegetable vendor without collateral to back a loan might share a cash-flow statement or use a mobile phone repayment history to demonstrate reliability.\r\n\r\n\r\nIndia’s newly established digital rules and practices lay the groundwork for this kind of system. The central bank now requires financial data to be reported in a standard, machine-readable format, which means it’s easier to automatically slice and share. India also has a history of collecting and protecting massive personal data sets, including biometric and payments information.\r\n\r\nA different approach\r\n\r\nThe new system will help lenders serve millions of small Indian companies that need to borrow an estimated 1.5 trillion rupees ($21 billion) a month, said BG Mahesh, co-founder of Sahamati, a non-profit collective of account aggregators.\r\n\r\n“Small banks can compete in this newly-leveled playing field by giving out sachet loans to businesses which have no assets other than cash flow,\" he said.\r\n\r\n\r\nRegardless, Indian users will have new, immediate access to their own financial information, and they’ll control who sees what and when. It’s a marked contrast with what happens in the US, where three big credit reporting agencies collect -- and resell -- a limited array of consumers’ financial data directly from the banks, with only cursory consent.\r\n\r\nIt’s also a different approach to data collection and privacy than Europe’s new General Data Protection Regulation, which strengthened consumers’ rights but still lets individual companies track users data.\r\n\r\nIndia’s “account aggregators\" are part of a broad push to comply with a 2017 Supreme Court ruling that designated privacy as a universal human right. Later this year, the Indian Parliament will renew debate on the Personal Data Protection Bill, which places new requirements on companies doing business in the country.', 'business, money, life', 454, 56, '/static/img/img4.jpg', 'January 10, 2020'),
(5, 'Siemens snubs Greta Thunberg\'s appeal, says will honor Adani coal mine contract', 'Siemens AG said it intends to honor a controversial contract to supply signaling systems to an Australian coal mine, defying the demands of activists that protested at locations in Germany on Friday.\r\n\r\nThe company will establish a sustainability committee that will have the power to stop or escalate projects, but the company will ultimately continue with the Adani contract, Chief Executive Officer Joe Kaeser said in a statement on Sunday.\r\n\r\n“I do realize, most of you would have hoped for more,\" Kaeser said in the statement. “While I do have a lot of empathy for environmental matters, I do need to balance different interests of different stakeholders.\"\r\n\r\nFridays for Future activists, including Greta Thunberg, had targeted Siemens to renounce the contract for months and not work with Adani Power Ltd. on the planned Carmichael coal mine in Queensland.\r\n\r\n“Siemens’ announcement that it will continue working on Adani’s coal mine while bushfires rage in Australia is nothing short of shameful,\" environmental lobby group Australian Conservation Foundation said in a statement. “The company has shown its true colours with this decision. It has a climate change policy, but it is hollow and empty.\"\r\n\r\nKaeser had met with German activist Luisa Neubauer on Friday, and in private talks offered the 23-year-old a seat on the supervisory board of Siemens Energy, which she turned down. Siemens Energy creates gas turbines and wind turbines, while the Adani contract will be supplied by Siemens Mobility, a different division.\r\n\r\nProtesters had also camped out at Siemens locations, including a 24-hour protest in front of the company’s headquarters in Munich.', 'business, money, life', 39, '/static/img/img5.jpg', 'January 10, 2020'),
(6, 'Why one of Asia\'s biggest diesel exporter India is buying from offshore', 'India -- one of Asia’s biggest diesel exporters -- is having to import large quantities of the industrial fuel as its refineries gear up for new emission rules that take effect in April.\r\n\r\nThe country imported 293,000 tons of diesel in December, a fivefold jump from November, figures from data intelligence firm Kpler show. However, it remained a net exporter of the fuel. Most of the imports are likely to be ultra low-sulfur grades that comply with the Bharat Stage VI standards, which mandate a maximum sulfur content of 0.001% in fuel for road vehicles.\r\n\r\nIndian Oil Corp., the country’s biggest refiner, imported 120,000 tons of diesel last month, said Rakesh Sehgal, executive director of supplies. It will continue offshore purchases until March as some of its refineries are upgraded to produce lower-emission fuels and is looking to import a further 160,000 tons, he said.\r\nTanks are being flushed and pipelines and pumps scoured to handle the cleaner diesel, said R. Ramachandran, director of refineries at Bharat Petroleum Corp. An increase in diesel demand has added to the need for imports, and several IOC refineries have been shut for maintenance recently, he said.\r\n“There was some prompt shortage of products as maintenance works coincided with a recovery in diesel consumption,\" said Senthil Kumaran, an analyst at FGE. “We think imports should ease off gradually as refiners will look to run at higher rates in the coming months after the conclusion of planned turnarounds.\"', 'business, money, life', 60, '/static/img/img6.jpg', 'December 06, 2019');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`No`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`No`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`No`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
