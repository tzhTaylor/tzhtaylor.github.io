#import "/typ/templates/blog.typ": *

#show: main.with(
  title: "First Paper Critique",
  desc: "EMISSARY: Enhanced Miss Awareness Replacement Policy for L2 Instruction Caching",
  date: "2025-05-18",
)

#set align(left)

= Paper review

The paper introduces EMISSARY, a cost-aware cache replacement policy specifically designed for instruction caching. The paper argues that not all cache misses have the same impact on performance and proposes treating instruction cache lines bimodally based on their miss cost. EMISSARY prioritizes instruction lines whose misses cause decode starvations and preserves them in the L2 cache upon eviction from L1I. The policy is designed to work with modern processors that tolerate many L1I misses and achieves a geomean speedup of $3.24%$ and energy savings of $2.1%$ when evaluated on server applications. The paper provides an overview of the EMISSARY techniques, quantifies the different behaviors of instruction cache lines, and describes the EMISSARY algorithm in detail. The results show that EMISSARY outperforms prior work in terms of speed and energy savings. The paper concludes by discussing the related work and the significance of EMISSARY in the context of aggressive front-end processors.

= Strength of the paper

== Novel cache replacement policy

The paper introduces EMISSARY, a cost-aware cache replacement policy specifically designed for instruction caches. This policy addresses the issue of decode starvation and improves performance and energy efficiency.

== Performance improvements

The paper demonstrates that EMISSARY consistently improves performance and saves energy compared to the TPLRU policy. It achieves a geomean performance gain of $3.24%$ (up to $23.7%$) and a geomean energy savings of $2.12%$ (up to $17.7%$) over TPLRU on top of a state-of-the-art FDIP prefetcher.

== Complementary techniques

The paper discusses the complementary nature of EMISSARY and Ripple, another cache replacement policy. The authors suggest that using EMISSARY and Ripple together can achieve the best of both techniques.

== Contextualization of benefits

The paper provides a contextualization of EMISSARY's benefits by comparing it to other techniques and models. It shows that EMISSARY achieves significant performance gains with a small hardware budget compared to other prefetching policies and even achieves a substantial portion of the performance gain of an unrealizable model with zero cycle miss latency.

== Experimental evaluation

The paper presents a comprehensive experimental evaluation using various benchmarks and workloads. It demonstrates the effectiveness of EMISSARY across different scenarios and provides insights into the performance trends and characteristics of the proposed policy.

= Weakness of the paper

== Limited comparison to other cache replacement policies

While the paper compares EMISSARY to the TPLRU policy and provides insights into its performance improvements, it lacks a comprehensive comparison with other state-of-the-art cache replacement policies. This limits the understanding of how EMISSARY performs against a wider range of techniques.

== Limited discussion on potential drawbacks

The paper does not thoroughly discuss any potential drawbacks or limitations of the EMISSARY policy. It would be beneficial to address any trade-offs or scenarios where EMISSARY may not perform as well or could have negative impacts on system performance.

== Lack of real-world implementation and evaluation

The paper primarily relies on simulation-based evaluation using McPAT for energy consumption modeling. While simulations provide valuable insights, a real-world implementation and evaluation on actual hardware would further validate the effectiveness and practicality of EMISSARY.

= Conclusion

I recommend this paper. It proposes a cost-aware cache replacement policy specifically designed for instruction caching. EMISSARY prioritizes lines that have caused decode starvation, ensuring that they are retained in the cache for longer. Overall, EMISSARY achieves significant performance gains and energy savings while remaining simple to implement. And also, I gain a lot extra knowledge from this paper. For example, to improve processor performance, the methods taught in class focus on reducing cache misses. However, I find that not all cache misses have identical costs. Cost-aware cache replacement policies recognize this and attempt to increase performance even at the cost of increased cache misses. For modern architectures, many misses do not impact performance at all. This is a new idea for me.
